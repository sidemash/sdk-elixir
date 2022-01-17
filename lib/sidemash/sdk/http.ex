defmodule Sidemash.Sdk.Http do


  def post(path, body, query_string, headers, auth) do
    call(path, :post, body, auth, query_string, headers)
  end

  def get(path, query_string, headers, auth) do
    call(path, :get, nil, auth, query_string, headers)
  end

  def list(path, query_string, headers, auth) do
    call(path, :get, nil, auth, query_string, headers)
  end

  def put(path, body, query_string, headers, auth)do
    call(path, :put, body, auth, query_string, headers)
  end

  def patch(path, body, query_string, headers, auth) do
    call(path, :patch, body, auth, query_string, headers)
  end

  def delete(path, body, query_string, headers, auth) do
    call(path, :delete, body, auth, query_string, headers)
  end



  defp host do "http://dev-api.sidemash.io" end
  def version do "v1.0" end

  defp sign(message, private_key) do
    :crypto.hmac(:sha512, private_key, message) |> Base.encode64
  end
  defp sha256(message) do
    :crypto.hash(:sha256, message) |> Base.encode64
  end
  defp compute_signed_headers(body, headers, auth) do
    map = Map.merge(%{"Accept" =>  "application/json", "Authorization" => "Bearer " <> auth.token, "User-Agent" => "Sdk Elixir " <> version()}, headers)
    Map.merge(map, if is_nil(body) do %{} else %{"Content-Type" => "application/json"} end)
  end

  Application.ensure_all_started(:inets)
  Application.ensure_all_started(:ssl)


  defp call(path, method, body, auth, query_string, headers) do
    body_str = if is_nil(body) do nil else Poison.encode!(body) end
    url = host() <> path <> query_string
    signed_headers = compute_signed_headers(body, if is_nil(headers) do %{} else headers end, auth)
    sdm_request =
      Sidemash.Sdk.HttpRequest.new(
        signed_headers,
        method,
        path,
        query_string,
        if is_nil(body_str) do nil else sha256(body_str) end
      )
    h = Map.merge(signed_headers, %{
      "X-Sdm-SignedHeaders" =>  Map.keys(signed_headers) |> Enum.join(", "),
      "X-Sdm-Nonce" =>  to_string(sdm_request.nonce),
      "X-Sdm-Signature" => ("SHA512 " <> sign(Sidemash.Sdk.HttpRequest.to_message(sdm_request), auth.private_key))
    }) |> Enum.map(fn {k, v} -> {to_charlist(k), to_charlist(v)} end)

    response =
      if is_nil(body_str) do
        :httpc.request(method, {to_charlist(url), h}, [], [])
      else
        :httpc.request(method, {to_charlist(url), h, 'application/json', to_charlist(body_str)}, [], [])
      end
    case response do
      {:ok, {{_, code, _message}, _response_headers, _   }} when code == 204 -> nil
      {:ok, {{_, code, _message}, _response_headers, body}} when 200 <= code and code < 300 ->
        {:ok, json} = Poison.decode(to_string(body))
        json
      {:ok, {{_, _code, _message}, _response_headers, body}} -> raise Sidemash.Sdk.HttpCallError, message: to_string(body)
      _ ->
        raise Sidemash.Sdk.HttpCallError, message: to_string(response)
    end
  end
end