defmodule Sidemash.Sdk.HttpRequest do
  @moduledoc """
  Documentation for `Sidemash.Sdk.HttpRequest`.
  """
  @enforce_keys [:signed_headers, :method, :path, :body_hash]
  defstruct [:signed_headers, :method, :path, :query_string, :body_hash, :nonce]

  def new(signed_headers, method, path, query_string, body_hash) do
    %Sidemash.Sdk.HttpRequest{
      nonce:  System.system_time(:millisecond),
      signed_headers: signed_headers,
      method: method,
      path: path,
      query_string: query_string,
      body_hash: body_hash,
    }
  end

  def to_message(request) do
    to_string(request.nonce) <>
    (request.signed_headers |> Enum.map(fn {header_name, header_value} -> header_name <> ":" <> header_value end) |> Enum.join("")) <>
    String.upcase(to_string(request.method)) <>
    request.path <>
    (if is_nil(request.query_string) do "" else request.query_string end) <>
    (if is_nil(request.body_hash) do "" else request.body_hash end)
  end
end
