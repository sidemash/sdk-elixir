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


defmodule Sidemash.Sdk.PublishRtmp do
  @moduledoc """
  Documentation for `PublishRtmp`.
  """

  @enforce_keys [:stream_key_prefix, :ip, :domain]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    stream_key_prefix: String.t(),
    ip: Sidemash.Sdk.SecureAndNonSecure.t(),
    domain: Sidemash.Sdk.SecureAndNonSecure.t()
  }

  def to_remote(publish_rtmp) do
    %{
      :streamKeyPrefix => publish_rtmp.stream_key_prefix,
      :ip => Sidemash.Sdk.SecureAndNonSecure.to_remote(publish_rtmp.ip),
      :domain => Sidemash.Sdk.SecureAndNonSecure.to_remote(publish_rtmp.domain)
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.PublishRtmp{
      stream_key_prefix: remote["streamKeyPrefix"],
      ip: Sidemash.Sdk.SecureAndNonSecure.from_remote(remote["ip"]),
      domain: Sidemash.Sdk.SecureAndNonSecure.from_remote(remote["domain"])
    }
  end
end
