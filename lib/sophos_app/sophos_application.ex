defmodule SophosApp.SophosApplication do
  use Application

  def start(_type, _args) do
    SophosApp.Supervisor.start_link([])
  end
end
