defmodule Strain do

  defp is_odd?(n), do: rem(n, 2) == 1
  defp is_even?(n), do: rem(n, 2) == 0
  defp noop(_), do: true

  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    keepFun(list, fun)
  end

  defp keepFun([ head | tail ], fun) do
    if fun.(head) == true do
      [ head | keepFun(tail, fun) ]
    else
      keepFun(tail, fun)
    end
  end

  # end of the resurcive keep function
  defp keepFun([], _fun) do
    []
  end


  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    discardFun(list, fun)
  end

  defp discardFun([ head | tail ], fun) do
    if fun.(head) == false do
      [ head | discardFun(tail, fun) ]
    else
      discardFun(tail, fun)
    end
  end

  # end of the resurcive keep function
  defp discardFun([], _fun) do
    []
  end
end
