defmodule SophosApp.PingPong do
  def start_ping_pong() do
    player_1 = spawn_link(__MODULE__, :handle_message, [])
    player_2 = spawn_link(__MODULE__, :handle_message, [])
    send(player_2, {:ping, player_2, player_1})
  end

  def handle_message() do
    receive do
      {:ping, sender, caller} ->
        IO.puts(:ping)
        :timer.sleep(1000)
        send(caller, {:pong, caller, sender})
        handle_message()

      {:pong, sender, caller} ->
        IO.puts(:pong)
        :timer.sleep(1000)
        send(caller, {:ping, caller, sender})
        handle_message()
    end
  end

end
