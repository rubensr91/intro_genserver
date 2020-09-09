defmodule IntroGenserver do
  use GenServer

  #Client

  def start_link(initial_state \\ []) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def add(pid, item) do
    GenServer.cast(pid, {:add, item})
  end

  def remove(pid, item) do
    GenServer.cast(pid, {:remove, item})
  end

  def view(pid) do
    GenServer.call(pid, :view)
  end

  def stop(pid) do
   GenServer.stop(pid, :normal, :infinity) 
  end

  #Server

  def init(list) do
    {:ok, list}
  end

  def terminate(_reason, list) do
    IO.puts "Done!"
    IO.inspect list
    :ok
  end

  def handle_call(:view, _from, list) do
   {:reply, list, list} 
  end
  
  def handle_cast({:add, item}, list) do
    updated_list = [item|list]
    {:noreply, updated_list}
  end

  def handle_cast({:remove, item}, list) do
    updated_list = Enum.reject(list, fn (i) -> i === item end)
    {:noreply, updated_list}
  end
end