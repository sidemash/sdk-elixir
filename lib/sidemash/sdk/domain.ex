defmodule Sidemash.Sdk.Domain do
  @moduledoc """
  Documentation for `Sidemash.Sdk.Domain`.
  """
  @enforce_keys [:_type, :id, :url, :created_time, :name, :status]
  defstruct [:_type, :id, :url, :created_time, :description, :foreign_data, :name, :status]


  def new(map) do
    %Sidemash.Sdk.Domain {
      _type: map["_type"],
      id: map["id"],
      url: map["url"],
      created_time: map["createdTime"],
      description: map["description"],
      foreign_data: map["foreignData"],
      name: map["name"],
      status: map["status"],
    }
  end

end
