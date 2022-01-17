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


defmodule Sidemash.Sdk.Auth do
  @moduledoc """
  Documentation for `Auth`.
  """

  @enforce_keys [:token, :secret_key]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    token: String.t(),
    secret_key: String.t()
  }

  def to_remote(auth) do
    %{
      :token => auth.token,
      :secretKey => auth.secret_key
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.Auth{
      token: remote["token"],
      secret_key: remote["secretKey"]
    }
  end
end
