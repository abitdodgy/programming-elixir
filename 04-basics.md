# Types

There are a few basic types in Elixir. Value types are ints, floats, atoms, rangers, and regular expressions. Collection types are tuples, lists, maps, and binaries.

## Lists

Lists are not like arrays. In Elixir, tuples are the closest thing to arrays. Lists are very easy to traverse linearly, but they are expensive to access in random order. For example in order to access the nth element, you have to traverse n-1 previous elements.

### List operators

```elixir
# Concatenation
[1, 2, 3] ++ [3, 4, 5] # [1, 2, 3, 3, 4, 5]

# Difference
[1, 2, 3] -- [2, 3] # [1]

# Membership
1 in [1, 2, 3] # true
5 in [1, 2, 3] # false
```

Elixir provides support for keyword lists via syntactic sugar. It converts keyword lists into two-value tuples under the hood.

```elixir
iex> [1, {:f_name, "Mohamad"}, {:l_name, "El-Husseini"}]
[1, f_name: "Mohamad", l_name: "El-Husseini"]
```

## Maps

A Map resembles a Hash in Ruby. It's a collection of key-value pairs. Keys can be any value or collection type like integers, floats, strings, tuples, ranges, or atoms. You can also use an expression, such as a function, or any combination of those types.

```elixir
iex> %{ 1 => 2, 1.0 => 2, rem(10, 6) => 1, 1..3 => 2, "name" => "Mohmad String", name: "Mohamad Atom" }
%{1 => 2, 4 => 1, 1.0 => 2, :name => "Mohamad", 1..3 => 2, "name" => "Mohmad"}
```

You can use a colon if the keys are atoms.

When keys are atoms, you can use dot notation to access maps. Otherwise you can use bracket notation. Using dot notation raises an error for absent keys, while bracket notation returns nil.

```elixir
iex> map = %{ "name" => "Mohamad String", :name => "Mohamad Atom"  }
iex> map.name
"Mohamad Atom"
iex> map["name"]
"Mohamad String"
iex> map["absent"]
nil
iex> map.absent
** (KeyError) key :absent not found in: %{:name => "Mohamad Atom", "name" => "Mohamad String"}
```

Like a Ruby hash, a map does not allow duplicate values for keys. Maps are also very efficient, especially as they grow, and they can be used in pattern matching. So when do we use one over the other? The book has this to say:

> In general, use keyword lists for things such as command line parameters and for passing around options, and use maps when you want an associative array.

## Operators

Nothing fancy here. The usual suspects except for `===` and `!==` for strict equality/inequality. There are `--` and `++` for list subtraction and concatenation. There's also a `<>` for binary concatenation. And of course, the `|>` macro, which is so famous by now that it doesn't need an explanation.

Of note are the `with` expression which allows the evaluation of a block based on multiple expressions.

```elixir
with a -> expression,
     b -> expression,
     ....
  do: expression(a, b)
```
