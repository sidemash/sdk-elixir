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


defmodule Sidemash.Sdk.StreamSquare do
  @moduledoc """
  Documentation for `StreamSquare`.
  """

  @enforce_keys [:id, :url, :_type, :status, :is_elastic, :size, :publish, :hook]
  defstruct [:id, :url, :_type, :status, :is_elastic, :size, :play_domain_name, :publish_domain_name, :publish, :hook, :description, :foreign_data]

  @type t :: %__MODULE__{
    id: String.t(),
    url: String.t(),
    _type: String.t(),
    status: Sidemash.Sdk.InstanceStatus.t(),
    is_elastic: boolean(),
    size: Sidemash.Sdk.StreamSquareSize.t(),
    play_domain_name: String.t() | nil,
    publish_domain_name: String.t() | nil,
    publish: Sidemash.Sdk.Publish.t(),
    hook: Sidemash.Sdk.Hook.t(),
    description: String.t() | nil,
    foreign_data: String.t() | nil
  }

  def _type do "StreamSquare" end 

  def to_remote(stream_square) do
    %{
      :id => stream_square.id,
      :url => stream_square.url,
      :_type => "StreamSquare",
      :status => stream_square.status,
      :isElastic => stream_square.is_elastic,
      :size => stream_square.size,
      :playDomainName => stream_square.play_domain_name,
      :publishDomainName => stream_square.publish_domain_name,
      :publish => Sidemash.Sdk.Publish.to_remote(stream_square.publish),
      :hook => Sidemash.Sdk.Hook.to_remote(stream_square.hook),
      :description => stream_square.description,
      :foreignData => stream_square.foreign_data
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.StreamSquare{
      id: remote["id"],
      url: remote["url"],
      _type: remote["_type"],
      status: String.to_atom(remote["status"]),
      is_elastic: remote["isElastic"],
      size: String.to_atom(remote["size"]),
      play_domain_name: remote["playDomainName"],
      publish_domain_name: remote["publishDomainName"],
      publish: Sidemash.Sdk.Publish.from_remote(remote["publish"]),
      hook: Sidemash.Sdk.Hook.from_remote(remote["hook"]),
      description: remote["description"],
      foreign_data: remote["foreignData"]
    }
  end
end
