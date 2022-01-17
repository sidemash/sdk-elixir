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


defmodule Sidemash.Sdk.SecureAndNonSecure do
  @moduledoc """
  Documentation for `SecureAndNonSecure`.
  """

  @enforce_keys [:secure, :non_secure_on80, :non_secure]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    secure: String.t(),
    non_secure_on80: String.t(),
    non_secure: String.t()
  }

  def to_remote(secure) do
    %{
      :secure => secure.secure,
      :nonSecureOn80 => secure.non_secure_on80,
      :nonSecure => secure.non_secure
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.SecureAndNonSecure{
      secure: remote["secure"],
      non_secure_on80: remote["nonSecureOn80"],
      non_secure: remote["nonSecure"]
    }
  end
end
