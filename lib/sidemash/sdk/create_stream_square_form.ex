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


defmodule Sidemash.Sdk.CreateStreamSquareForm do
  @moduledoc """
  Documentation for `CreateStreamSquareForm`.
  """

  @enforce_keys [:is_elastic, :size, :hook]
  defstruct [:is_elastic, :size, :hook, :description, :foreign_data, :play_domain_name, :publish_domain_name]

  @type t :: %__MODULE__{
    is_elastic: boolean(),
    size: Sidemash.Sdk.StreamSquareSize.t(),
    hook: Sidemash.Sdk.Hook.t(),
    description: String.t() | nil,
    foreign_data: String.t() | nil,
    play_domain_name: String.t() | nil,
    publish_domain_name: String.t() | nil
  }

  def to_remote(form) do
    %{
      :isElastic => form.is_elastic,
      :size => form.size,
      :hook => Sidemash.Sdk.Hook.to_remote(form.hook),
      :description => form.description,
      :foreignData => form.foreign_data,
      :playDomainName => form.play_domain_name,
      :publishDomainName => form.publish_domain_name
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.CreateStreamSquareForm{
      is_elastic: remote["isElastic"],
      size: String.to_atom(remote["size"]),
      hook: Sidemash.Sdk.Hook.from_remote(remote["hook"]),
      description: remote["description"],
      foreign_data: remote["foreignData"],
      play_domain_name: remote["playDomainName"],
      publish_domain_name: remote["publishDomainName"]
    }
  end
end
