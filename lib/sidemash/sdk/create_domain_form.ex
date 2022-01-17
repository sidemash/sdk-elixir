defmodule Sidemash.Sdk.CreateDomainForm do
  @moduledoc """
  Documentation for `Sidemash.Sdk.CreateDomainForm`.
  """
  @enforce_keys [:name, :purpose]
  defstruct [:name, :purpose, :description, :foreign_data]


  def new(name, purpose, description \\ nil, foreign_data \\ nil) do
    %Sidemash.Sdk.CreateDomainForm {
      name: name,
      purpose: purpose,
      description: description,
      foreign_data: foreign_data
    }
  end

  def to_remote(client) do
    %{
      :name => client.name,
      :purpose => client.purpose,
      :description => client.description,
      :foreignData => client.foreign_data,
    }
  end
end
