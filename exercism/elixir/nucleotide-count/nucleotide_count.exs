defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if strand != '' do
      strand
        |> Enum.count(fn(x) -> x == nucleotide end)
    else
      0
    end
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    Map.new([
      {?A, count(strand, ?A)},
      {?T, count(strand, ?T)},
      {?C, count(strand, ?C)},
      {?G, count(strand, ?G)}
    ])
  end
end
