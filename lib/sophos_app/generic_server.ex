defmodule SophosApp.GenericServer do
  def start(module,init, caller \\ self()) do
    Process.flag(:trap_exit, true)
    spawn_link(__MODULE__, :loop, [module, caller, init])
  end

  def start_link(module, caller) do
    spawn_link(fn -> loop(module, caller, 0) end)
  end

  def start_monitor(module, caller) do
    spawn_monitor(fn -> loop(module, caller, 0) end)
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
