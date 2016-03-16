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

Chop.guess(273, 1..1000)
