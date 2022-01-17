defmodule Sidemash.Sdk.DomainService do
  @moduledoc """
  Documentation for `Sidemash.Sdk.DomainService`.
  """
  @enforce_keys [:auth]
  defstruct [:auth, :create]


  def new(auth) do
    %Sidemash.Sdk.DomainService {
      auth: auth,
      create: fn create_domain_form ->
        remote = Sidemash.Sdk.Http.post("/v1.0/domains", Sidemash.Sdk.CreateDomainForm.to_remote(create_domain_form), auth, "", nil)
        Sidemash.Sdk.Domain.new(remote)
      end
    }
  end
end