# Modules and Named Functions

The `do` and `end` blocks group expressions, and are syntactic sugar for `do: expression`. For example,

```elixir
defmodule Greeter do
  def greet(name, greeting) do
    IO.puts name
    IO.puts greeting
  end
end
```

can be written with `do:` and brackets:

```elixir
defmodule Greeter do
  def greet(name, greeting), do: (
    IO.puts name
    IO.puts greeting
  )
end
```

Unlike annonymous functions, named functions with multiple clauses have different body definitions.

```elixir
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end
```

In a nutshell, pattern matching allows us to invoke a function clause based on the arguments passed. We can take this a step further and match based on arguments' types, or a test involving their values. Guard clauses make this possible.

Nesting modules in Elixir is an illusion. Elixir simply creates a single name using a dot to separate the names of the nested modules.

```elixir
defmodule Hello do
  defmodule World do
  end
end
```

The above declaration becomes `defmodule Hello.World`. The names are joined with a dot as the delimiter.


### Exercise: Modules and Functions 1

Extend the times module with triple:

```elixir
defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
end
```

### Exercise: Modules and Functions 2

Run the result in IEx using both techniques.

```
# When inside iex
c "times.exs"

# When outside iex
ixs times.exs
```

### Exercise: Modules and Functions 3

Add a quadruple function.

```elixir
def quadruple(n) do
  double(n) + double(n)
end
```

### Exercise: Modules and Functions 4

Recursive sum.

```elixir
defmodule Sum do
  def of(0), do: 0
  def of(n), do: n + of(n-1)
end
```

### Exercise: Modules and Functions 5

GCD.

```elixir
defmodule GCD do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x,y))
end
```

### Exercise: Modules and Functions 6

I'm thinking of a number between 1 and 1000.

```elixir
defmodule Chop do
  def guess(actual, range = min..max) do
    guess = div(min + max, 2)
    IO.puts "Is it #{guess}?"
    guess(actual, guess, range)
  end

  defp guess(actual, actual, _), do: IO.puts "Yes, it's #{actual}"
  defp guess(actual, guess, _..max) when guess < actual, do: guess(actual, guess+1..max)
  defp guess(actual, guess, min.._) when guess > actual, do: guess(actual, min..guess-1)
end
```

### Exercise: Modules and Functions 7

Convert a float to a string with two decimal digits.

```erlang
:erlang.float_to_binary 7.12, [{:decimals, 2}] # Yay! Erlang from Elixir
```

Get the value of an env variable.

```elixir
System.get_env "_system_arch" # Returns system architecture.
```

Return the extension component of a filename.

```elixir
iex> ls
Elixir.Chop.beam 			Elixir.DefaultValues.beam 			Elixir.Times.beam

iex> Path.extname "Elixir.Chop.beam"
".beam"
```

Return a process' current working directory.

```elixir
System.cwd
```
