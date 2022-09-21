defmodule SophosApp.GenericServer do
  def start(module, caller) do
    spawn(fn -> loop(module, caller, 0) end)
  end

  def start_link(module, caller) do
    spawn_link(module, :handle_message, [caller])
  end

  def start_monitor(module, caller) do
    spawn_monitor(module, :handle_message, [caller])
  end

  def loop(module, caller, state) do
    receive do
      msg ->
        {:ok, result, new_state} = module.handle_message(msg, caller, state)
        send(caller, result)
        loop(module, caller, new_state)
    end
  end

end
