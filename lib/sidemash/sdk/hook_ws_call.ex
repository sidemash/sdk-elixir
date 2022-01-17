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


defmodule Sidemash.Sdk.HookWsCall do
  @moduledoc """
  Documentation for `HookWsCall`.
  """

  @enforce_keys [:_type, :method, :url]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    _type: String.t(),
    method: Sidemash.Sdk.HttpMethod.t(),
    url: String.t()
  }

  def _type do "HookWsCall" end 

  def to_remote(call) do
    %{
      :_type => "HookWsCall",
      :method => call.method,
      :url => call.url
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.HookWsCall{
      _type: remote["_type"],
      method: String.to_atom(remote["method"]),
      url: remote["url"]
    }
  end
end
