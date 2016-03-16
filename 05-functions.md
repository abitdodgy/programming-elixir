# Functions

Functions can have multiple bodies that can be used to make pattern matches.

```elixir
handle_open = fn
  {:ok, file} -> "Read: #{IO.read file, :line}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end
```

We call annonymous functions using a dot notation.

```elixir
sum = fn x, y -> x + y end
sum.(1,2)
```

There is a shortcut that makes annonymous functions easier to work with.

```elixir
Enum.map [1,2,3,4], fn x -> x * x end
Enum.map [1,2,3,4], &(&1 * &1)

# Or
sum = fn x, y -> x + y end
Enum.map [1,2,3,4], &sum.(&1, 1)
```
We can use a named function and its arity with the `&` capture notation.

```elixir
Enum.each [1,2,3,4], &IO.puts/1

# Or
Enum.each [1,2,3,4], &IO.puts(&1)
```

You can assign existing functions to a variable by capturing them with the `&` notation.

```elixir
l = &length/1
l.([1,2,3,4])
```

Because `[]` and `{}` are operators in Elixir, we can turn literal lists and tuples into functions.

```elixir
divrem = &{ div(&1, &2), rem(&1, &2) }
divrem.(10,3)
```

We can use the pin operator with function params to match against their current value.

```elixir
defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting}, #{name}"
      (_) -> "I don't know you."
    end
  end
end

mohamad_greeter = Greeter.for("Mohamad", "Hello")
IO.puts mohamad_greet.("Mohamad")
IO.puts mohamad_greet.("Rigobert") # Booooom!
```

In the above example, calling `Greeter.for("Mohamad", "Hello")` returns a function that takes one argument, and will try to match against the value passed to its parent, "Mohamad".

## Exercises

### Exercise: Functions-1

`list_concat` expectation:

```elixir
list_concat.([:a, :b], [:c, :d])
#=> [:a, :b, :c, :d]
```

`list_concat` solution:

```elixir
list_concat = fn list_one, list_two -> list_one ++ list_two end
```

`sum` expectation:

```elixir
sum.(1, 2, 3)
#=> 6
```

`sum` solution:

```elixir
sum = fn (a, b, c) -> a + b + c end
sum.(1, 2, 3)
```

`pair_tuple_to_list` expectation:

```elixir
pair_tuple_to_list.({ 1234, 5678 })
#=> [1234, 5678]

`pair_tuple_to_list` solution:

```elixir
pair_tuple_to_list = fn {a, b} -> [a, b] end
```

### Exercise: Functions-2

```elixir
fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end
```

### Exercise: Functions-3

```elixir
fizz_buzz_from_rem = fn n ->
  fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

fizz_buzz_from_rem.(10)
fizz_buzz_from_rem.(11)
fizz_buzz_from_rem.(12)
fizz_buzz_from_rem.(13)
fizz_buzz_from_rem.(14)
fizz_buzz_from_rem.(15)
fizz_buzz_from_rem.(16)
fizz_buzz_from_rem.(17)
```

### Exercise: Functions-4

```elixir
prefix = fn prefix -> (fn suffix -> "#{prefix} - #{suffix}" end) end
suffixer = prefix.("Hello")
suffixer.("Mohamad")
prefix.("Elixir").("rocks!")
```

### Exercise Functions-5

Rewrite the following functions using the `&` notation.

```elixir
Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.each [1,2,3,4], fn x -> IO.inspect x end
```

Solutions:

```elixir
Enum.map [1,2,3,4], &(&1 + 2)
Enum.each [1,2,3,4], &IO.inspect/1
```

