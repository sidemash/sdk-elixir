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


defmodule Sidemash.Sdk.StreamSquareService do
  @moduledoc """
  Documentation for `StreamSquareService`.
  """

  @enforce_keys [:auth, :create, :get, :list_with, :list, :update, :delete]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    auth: Sidemash.Sdk.Auth.t(),
    create: (Sidemash.Sdk.CreateStreamSquareForm.t() -> Sidemash.Sdk.StreamSquare.t()),
    get: (String.t() -> Sidemash.Sdk.StreamSquare.t()),
    list_with: (Sidemash.Sdk.ListForm.t() | nil -> Sidemash.Sdk.StreamSquareRestCollection),
    list: (-> Sidemash.Sdk.StreamSquareRestCollection),
    update: (Sidemash.Sdk.UpdateStreamSquareForm.t() -> Sidemash.Sdk.StreamSquare.t()),
    delete: (String.t() -> none())
  }

  def new(auth) do
    %Sidemash.Sdk.StreamSquareService {
      auth: auth,
      create: fn form -> 
        remote = Sidemash.Sdk.Http.post("/" <> Sidemash.Sdk.Http.version <> "/stream-squares", form.to_remote, "", {}, auth)
        Sidemash.Sdk.StreamSquare.from_remote(remote)
      end, 
      get: fn id -> 
        remote = Sidemash.Sdk.Http.get("/" <> Sidemash.Sdk.Http.version <> "/stream-squares/" <> id, "", {}, auth)
        Sidemash.Sdk.StreamSquare.from_remote(remote)
      end, 
      list_with: fn form -> 
        qs = if is_nil(form) do "" else Sidemash.Sdk.ListForm.to_query_string(form) end 
        remote = Sidemash.Sdk.Http.list("/" <> Sidemash.Sdk.Http.version <> "/stream-squares", qs, {}, auth)
        Sidemash.Sdk.StreamSquareRestCollection.from_remote(remote)
      end, 
      list: fn  -> 
        remote = Sidemash.Sdk.Http.list("/" <> Sidemash.Sdk.Http.version <> "/stream-squares", "", {}, auth)
        Sidemash.Sdk.StreamSquareRestCollection.from_remote(remote)
      end, 
      update: fn form -> 
        remote = Sidemash.Sdk.Http.patch("/" <> Sidemash.Sdk.Http.version <> "/stream-squares/" <> form.id, form.to_remote, "", {}, auth)
        Sidemash.Sdk.StreamSquare.from_remote(remote)
      end, 
      delete: fn id -> 
        Sidemash.Sdk.Http.delete("/" <> Sidemash.Sdk.Http.version <> "/stream-squares/" <> id, nil, "", {}, auth)
      end
    }
  end
end
