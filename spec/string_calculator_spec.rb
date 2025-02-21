require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe ".add" do
    it "returns 0 for empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns 1 for '1'" do
      expect(calculator.add("1")).to eq(1)
    end

    it "returns 3 for '1,5'" do
      expect(calculator.add("1,5")).to eq(6)
    end
  end
end
