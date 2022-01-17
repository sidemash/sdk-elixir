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


defmodule Sidemash.Sdk.Hook do
  @moduledoc """
  Documentation for `Hook`.
  """

  alias Sidemash.Sdk.HookHttpCall
  alias Sidemash.Sdk.HookWsCall

  @type t :: HookHttpCall.t | HookWsCall.t

  def http_call?(hook) do
    hook._type == HookHttpCall._type
  end

  def ws_call?(hook) do
    hook._type == HookWsCall._type
  end

  def not_http_call?(hook) do
    hook._type != HookHttpCall._type
  end

  def not_ws_call?(hook) do
    hook._type != HookWsCall._type
  end

  def to_remote(hook) do
    case hook._type do
      ty when ty == "Hook.HttpCall" -> HookHttpCall.to_remote(hook)
      ty when ty == "Hook.WsCall" -> HookWsCall.to_remote(hook)
      ty -> raise(ArgumentError, "Invalid hook of type Sidemash.Sdk.Hook submitted. Got unexpected 'hook._type' = " <> to_charlist(ty))
    end
  end

  def from_remote(remote) do
    case remote["_type"] do
      ty when ty == "Hook.HttpCall" -> HookHttpCall.from_remote(remote)
      ty when ty == "Hook.WsCall" -> HookWsCall.from_remote(remote)
      ty -> raise(ArgumentError, "Invalid hash submitted for creating 'Sidemash.Sdk.Hook'. Got unexpected '_type' = " <> to_charlist(ty))
    end
  end
end
