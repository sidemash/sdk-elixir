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


defmodule Sidemash.Sdk.ListForm do
  @moduledoc """
  Documentation for `ListForm`.
  """

  @enforce_keys []
  defstruct [:where, :limit, :order_by]

  @type t :: %__MODULE__{
    where: String.t() | nil,
    limit: integer() | nil,
    order_by: String.t() | nil
  }

  def to_query_string(form) do
    if is_nil(form.where) and is_nil(form.limit) and is_nil(form.order_by) do
      ""
    else
      all = [
        if is_nil(form.where) do nil else "where=" <> form.where end,
        if is_nil(form.limit) do nil else "limit=" <> form.limit end,
        if is_nil(form.order_by) do nil else "orderBy=" <> form.order_by end
      ]
      "?" <> (all |> Enum.filter(fn x -> !is_nil(x) end) |> Enum.join("&"))
    end
  end

  def to_remote(form) do
    %{
      :where => form.where,
      :limit => form.limit,
      :orderBy => form.order_by
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.ListForm{
      where: remote["where"],
      limit: remote["limit"],
      order_by: remote["orderBy"]
    }
  end
end
