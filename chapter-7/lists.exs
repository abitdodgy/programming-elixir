defmodule ListLen do
  def len([]), do: 0
  def len([ _ | tail ]), do: 1 + len(tail)

  def squares([], sqr_list), do: sqr_list
  def squares([ head | tail], sqr_list), do: squares(tail, [ head * head | sqr_list ])

  def sqr([]), do: []
  def sqr([ head | tail]), do: [ head * head | sqr(tail) ]

  #
  def add_one([]), do: []
  def add_one([ head | tail ]), do: [ head + 1 | add_one(tail) ]

  # map() which can generalize all the above: add_one(), sqr(), squares(), and len().
  def map([], _), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  # sum() with an accumulator value
  def sum(list), do: sum(list, 0)
  defp sum([], total), do: total
  defp sum([ head | tail ], total), do: sum(tail, head + total)

  # sum() without an accumulator
  def sum2([]), do: 0
  def sum2([ head | tail ]), do: head + sum(tail)

  # reduce, which can generalize the sum() and sum2()

end
