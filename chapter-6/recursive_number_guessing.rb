# This is just a ruby class to experiment with recursion as opposed to how its done in Elixir.
# See chop.exs to see the same script for Elixir.

#
# First try...
class RecursiveNumberGuessing
  attr_reader :actual

  def initialize(actual:)
    @actual = actual
  end

  def play(range:)
    guess = (range.min + range.max) / 2
    puts "Is it #{guess}?"
    guess(guess: guess, range: range)
  end

  def guess(guess:, range:)
    if guess < actual
      play range: (guess + 1)..range.max
    elsif guess > actual
      play range: range.min..(guess-1)
    else
      puts "Yes, it's #{actual}!"
    end
  end
end

game = RecursiveNumberGuessing.new(actual: 273)
game.play(range: 1..1000)

#
# Second try
class RecursiveNumberGuessing
  attr_reader :actual

  def initialize(actual:)
    @actual = actual
  end

  def play(range:)
    guess = (range.min + range.max) / 2
    puts "Is it #{guess}?"
    guess(guess: guess, range: range)
  end

  def guess(guess:, range:)
    if guess < actual
      guess_higher(guess: guess, range: range)
    elsif guess > actual
      guess_lower(guess: guess, range: range)
    else
      puts "Yes, it's #{actual}!"
    end
  end

private

  def guess_higher(guess:, range:)
    play range: (guess + 1)..range.max
  end

  def guess_lower(guess:, range:)
    play range: range.min..(guess-1)
  end
end

game = RecursiveNumberGuessing.new(actual: 273)
game.play(range: 1..1000)

#
# Third try...

class RecursiveNumberGuessing
  attr_reader :actual

  def initialize(actual:)
    @actual = actual
  end

  def play(range:)
    guess = (range.min + range.max) / 2
    puts "Is it #{guess}?"
    guess(guess: guess, range: range)
  end

private

  def guess(guess:, range:)
    return puts("Yes, it's #{actual}!") if guess == actual
    new_range = if guess < actual
      (guess + 1)..range.max
    else
      range.min..(guess-1)
    end
    play(range: new_range)
  end
end

game = RecursiveNumberGuessing.new(actual: 273)
game.play(range: 1..1000)

#
# Fourth try...

class RecursiveNumberGuessing
  attr_reader :actual

  def initialize(actual:)
    @actual = actual
  end

  def play(range:)
    guess = (range.min + range.max) / 2
    puts "Is it #{guess}?"
    guess(guess: guess, range: range)
  end

private

  def guess(guess:, range:)
    return actual if won?(guess: guess)
    play range: narrow_range(guess: guess, range: range)
  end

  def won?(guess:)
    guess == actual
  end

  def narrow_range(guess:, range:)
    if guess < actual
      (guess + 1)..range.max
    elsif guess > actual
      range.min..(guess-1)
    end
  end
end

game = RecursiveNumberGuessing.new(actual: 273)
game.play(range: 1..1000)
