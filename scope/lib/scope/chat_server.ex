defmodule Scope.ChatServer do
  use DynamicSupervisor

  def start_link(opts \\ []) do
    DynamicSupervisor.start_link(__MODULE__, opts)
  end

  def init(init_state \\ []) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(:new, topic) do
    children = {Agent, fn -> %{} end}
    {:ok, channel} = DynamicSupervisor.start_child(__MODULE__, children)
  end
end
