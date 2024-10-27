hello = "Hello World!"

IO.puts hello

IO.puts :hello!

add_five = fn n -> n + 5 end
add_ten = &(&1 + 10)

IO.puts( add_ten.( add_five.(23) ) )

23 |> add_five.() |> add_ten.() |> IO.puts()

list = [1, 2, 3]

map = %{:a => 1, :b => 2}

[a,b,c] = [1,2,3]

if true do
  IO.puts "dewit!"
end

unless false do
  IO.puts "dewit!"
end

case {1,2,3} do
  {1,2,3} -> "No match"
  {1,x,3} -> "Bind x to 2"
  _       -> "Bind any value"
end

defmodule Human do
  def walk() do
    IO.puts "walking..."
  end
  def listen() do
    receive do
      {:yo} -> IO.puts("message received!")
    end
  end
  
  listen()
end

pid = spawn(Human, :listen, [])

send pid, {:yo}


