#   Copyright © 2020 Sidemash Cloud
#
#   Licensed under the Apache  License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless  required  by  applicable  law  or  agreed to in writing,
#   software  distributed  under  the  License  is distributed on an
#   "AS IS"  BASIS, WITHOUT  WARRANTIES  OR CONDITIONS OF  ANY KIND,
#   either  express  or  implied.  See the License for the  specific
#   language governing permissions and limitations under the License.


defmodule Sidemash.Sdk.UpdateStreamSquareForm do
  @moduledoc """
  Documentation for `UpdateStreamSquareForm`.
  """

  @enforce_keys [:id, :remove, :set]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    id: String.t(),
    remove: MapSet.t(String.t()),
    set: Map.t(String.t(), any())
  }

  def by_id(id) do
    %Sidemash.Sdk.UpdateStreamSquareForm{id: id, remove: MapSet.new(), set: %{} }
  end

  def remove_description(form) do
    new_remove = form.remove |> MapSet.put("description")
    %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: new_remove, set: form.set}
  end

  def remove_foreign_data(form) do
    new_remove = form.remove |> MapSet.put("foreignData")
    %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: new_remove, set: form.set}
  end

  def with_is_elastic(form, is_elastic) do
      new_set = form.set |> Map.merge(%{"isElastic" => is_elastic})
      %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: form.remove, set: new_set}
  end

  def with_size(form, size) do
      new_set = form.set |> Map.merge(%{"size" => size})
      %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: form.remove, set: new_set}
  end

  def with_hook(form, hook) do
      new_set = form.set |> Map.merge(%{"hook" => Sidemash.Sdk.Hook.to_remote(hook)})
      %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: form.remove, set: new_set}
  end

  def with_description(form, description) do
    if is_nil(description) do
      form
    else
      new_set = form.set |> Map.merge(%{"description" => description})
      %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: form.remove, set: new_set}
    end
  end

  def with_foreign_data(form, foreign_data) do
    if is_nil(foreign_data) do
      form
    else
      new_set = form.set |> Map.merge(%{"foreignData" => foreign_data})
      %Sidemash.Sdk.UpdateStreamSquareForm{id: form.id, remove: form.remove, set: new_set}
    end
  end

  def to_remote(form) do
    %{
      :remove => form.remove,
      :set => form.set
    }
  end
end
