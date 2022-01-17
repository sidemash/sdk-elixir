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


defmodule Sidemash.Sdk.UTCDateTime do
  @moduledoc """
  Documentation for `UTCDateTime`.
  """

  @enforce_keys [:iso8601, :timestamp]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    iso8601: String.t(),
    timestamp: Sidemash.Sdk.Timestamp.t()
  }

  def to_remote(time) do
    %{
      :iso8601 => time.iso8601,
      :timestamp => Sidemash.Sdk.Timestamp.to_remote(time.timestamp)
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.UTCDateTime{
      iso8601: remote["iso8601"],
      timestamp: Sidemash.Sdk.Timestamp.from_remote(remote["timestamp"])
    }
  end
end
