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


defmodule Sidemash.Sdk.StreamSquareRestCollection do
  @moduledoc """
  Documentation for `StreamSquareRestCollection`.
  """

  @enforce_keys [:url, :pagination, :items]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    url: String.t(),
    pagination: Sidemash.Sdk.Pagination.t(),
    items: list(Sidemash.Sdk.StreamSquare.t())
  }

  def from_remote(remote) do
    %Sidemash.Sdk.StreamSquareRestCollection{
      url: remote["url"],
      pagination: Sidemash.Sdk.Pagination.from_remote(remote["pagination"]),
      items: remote["items"] |> Enum.map(fn h -> Sidemash.Sdk.StreamSquare.from_remote(h) end)
    }
  end
end
