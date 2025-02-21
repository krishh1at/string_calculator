class StringCalculator
  def add(input)
    0 if input.empty?

    input.split(/,|\n/).map(&:to_i).sum
  end
end
