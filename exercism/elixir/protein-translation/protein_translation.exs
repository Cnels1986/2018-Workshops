defmodule ProteinTranslation do

  @codons %{
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"}

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    # divides string up every 3 characters
    codonList = for <<x::binary-3 <- rna>>, do: x
    checkCodons(codonList)
  end

  defp checkCodons([head | tail]) do
    x = Map.get(@codons, head)
    [x | checkCodons(tail) ]
  end

  # end of recusion
  defp checkCodons([]) do
    []
  end


  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    x = {:ok, Map.get(@codons, codon)}
  end

end
