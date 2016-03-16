defmodule GCD do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x,y))
end

# GCD.of  8, 12 # 1
# GCD.of 12,  8 # 2
# GCD.of  8,  4 # 3
# GCD.of  4,  0 # 4
