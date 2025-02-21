class StringCalculator
  def add(input)
    0 if input.empty?

    delimiter = /,|\n/  # Default delimiters: comma `,` or newline `\n`

    # Custom delimiter
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter = parts[0][2]
      input = parts[1]
    end

    input.split(delimiter).map(&:to_i).sum
  end
end
