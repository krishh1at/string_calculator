class StringCalculator
  def add(input)
    0 if input.empty?

    input.split(",").map(&:to_i).sum
  end
end
