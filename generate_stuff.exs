## git clean -f -d -n -> see what changes
## git clean -f -d -> !! removes untracked files
File.cd "apps/back"
range = 1..2 |> Enum.map(&(&1))
template = fn(x)-> "mix phoenix.gen.html  Monster#{x} monsters#{x} name:string description:string" end
doerfn = fn(x)-> :os.cmd(x |> to_char_list) |> IO.puts end
range |> Enum.map(fn(x) -> doerfn.(template.(x)) end)
