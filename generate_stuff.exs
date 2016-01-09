## git clean -f -d -n -> see what changes
## git clean -f -d -> !! removes untracked files

# $ elixir generate_stuff.exs

File.cd "apps/back"
range = 1..60 |> Enum.map(&(&1))
template = fn(x)-> "mix phoenix.gen.html  Monster#{x} monsters#{x} name:string description:string" end
doerfn = fn(x)-> :os.cmd(x |> to_char_list) |> IO.puts; :timer.sleep(500)  end
range |> Enum.map(fn(x) -> doerfn.(template.(x)) end)
