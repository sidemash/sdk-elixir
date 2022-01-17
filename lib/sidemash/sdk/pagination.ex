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


defmodule Sidemash.Sdk.Pagination do
  @moduledoc """
  Documentation for `Pagination`.
  """

  @enforce_keys [:self_url, :started_time, :nb_items_on_this_page, :page, :nb_items_per_page]
  defstruct [:self_url, :prev_url, :next_url, :started_time, :nb_items_on_this_page, :page, :nb_items_per_page]

  @type t :: %__MODULE__{
    self_url: String.t(),
    prev_url: String.t() | nil,
    next_url: String.t() | nil,
    started_time: Sidemash.Sdk.UTCDateTime.t(),
    nb_items_on_this_page: integer(),
    page: integer(),
    nb_items_per_page: integer()
  }

  def to_remote(pagination) do
    %{
      :selfUrl => pagination.self_url,
      :prevUrl => pagination.prev_url,
      :nextUrl => pagination.next_url,
      :startedTime => Sidemash.Sdk.UTCDateTime.to_remote(pagination.started_time),
      :nbItemsOnThisPage => pagination.nb_items_on_this_page,
      :page => pagination.page,
      :nbItemsPerPage => pagination.nb_items_per_page
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.Pagination{
      self_url: remote["selfUrl"],
      prev_url: remote["prevUrl"],
      next_url: remote["nextUrl"],
      started_time: Sidemash.Sdk.UTCDateTime.from_remote(remote["startedTime"]),
      nb_items_on_this_page: remote["nbItemsOnThisPage"],
      page: remote["page"],
      nb_items_per_page: remote["nbItemsPerPage"]
    }
  end
end
