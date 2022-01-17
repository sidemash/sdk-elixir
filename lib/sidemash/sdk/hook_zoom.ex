defmodule Sidemash.Sdk.HookZoom do
  @moduledoc """
  Documentation for `HookZoom`.
  """

  @enforce_keys [:_type]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
    _type: String.t()
  }

  def _type do "HookZoom" end 

  def to_remote(hook_zoom) do
    %{
      :_type => "HookZoom"
    }
  end

  def from_remote(remote) do
    %Sidemash.Sdk.HookZoom{
      _type: remote["_type"]
    }
  end
end
