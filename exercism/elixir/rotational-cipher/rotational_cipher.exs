defmodule RotationalCipher do
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> to_charlist        #converts string to a list of characters
      |> shift(shift)       #rotates letters through recursion
      |> to_string          #converts the shifted list back to string
  end

  # for the capital letters, where Z is hit and needs to start back at A
  def shift([head | tail], rot) when head >= ?A and head <= ?Z and (head + rot) > ?Z do
    x = (head + rot) - ?Z - 1
    [ ?A + x | shift(tail, rot)]
  end

  # for the lowercase letters, where z is hit and needs to start back at a
  def shift([head | tail], rot) when head >= ?a and head <= ?z and (head + rot) > ?z do
    x = (head + rot) - ?z - 1
    [ ?a + x | shift(tail, rot)]
  end

  # for everything not a letter
  def shift([head | tail], rot) when (head < ?A or head > ?Z) and (head < ?a or head > ?z) do
    [head | shift(tail, rot)]
  end

  # rotates the letters, both lower and uppercase where they don't reach z/Z
  def shift([head | tail], rot) do
    [ head + rot | shift(tail, rot) ]
  end

  # end of the recusion
  def shift([], _rot) do
    []
  end
end
