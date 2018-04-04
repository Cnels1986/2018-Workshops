defmodule SecretHandshake do

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do

    handshake = []
    # too many bits or just the reversing
    if code < 32 && code != 16 do

      # handshake will be reversed
      if code >= 16 do
        reverse = true
        code = code - 16
      end

      # calls a recursion loop
      handshake = handshake_loop(code, handshake)

      if reverse == true do
        handshake = Enum.reverse(handshake)
      end
    end

    handshake

  end

  # end of the recursion loop
  def handshake_loop(x, handshakeList) when x <= 0 do
    handshakeList
  end

  # recursion!!!
  def handshake_loop(x, handshakeList) do
    cond do
      x >= 8 ->
        handshakeList = List.insert_at(handshakeList, 0, "jump")
        x = x - 8
      x >= 4 ->
        handshakeList = List.insert_at(handshakeList, 0, "close your eyes")
        x = x - 4
      x >= 2 ->
        handshakeList = List.insert_at(handshakeList, 0, "double blink")
        x = x - 2
      x >= 1 ->
        handshakeList = List.insert_at(handshakeList, 0, "wink")
        x = x - 1
    end
    handshake_loop(x, handshakeList)
  end

end
