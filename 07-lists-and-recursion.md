# Lists and Recursion

A list may either be empty or consist of a head and a tail. This is a recursive defintion. The head contains a value, and the tail is itself a list, even if its an empty one.

```elixir
empty_list = []
list1 = [ 1 | [] ]
list2 = [ 1 | [ 2 | [] ] ]
list3 = [ 1 | [ 2 | [ 3 | [] ] ] ]
# etc...
```

Considering this, we can say that:

1. The length of an empty list is 0
2. The length of a list is one (the head) plus the length of the tail.

```elixir
defmodule ListLen do
  def len([]), do: 0
  def len([ head | tail ]), do: 1 + len(tail)
end
```

Every list is terminated by an empty list.
