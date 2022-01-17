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


defmodule Sidemash.Sdk.Publish do
  @moduledoc """
  Documentation for `Publish`.
  """

  @enforce_keys [:rtmp]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    rtmp: Sidemash.Sdk.PublishRtmp.t()
  }

  def to_remote(publish) do
    %{
      :rtmp => Sidemash.Sdk.PublishRtmp.to_remote(publish.rtmp)
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.Publish{
      rtmp: Sidemash.Sdk.PublishRtmp.from_remote(remote["rtmp"])
    }
  end
end
