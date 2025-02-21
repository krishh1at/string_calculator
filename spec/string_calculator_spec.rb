require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe ".add" do
    context "for empty string" do
      it "returns 0" do
        expect(calculator.add("")).to eq(0)
      end
    end

    context "for single number" do
      it "returns 1 for '1'" do
        expect(calculator.add("1")).to eq(1)
      end
    end

    context "for comma separated numbers" do
      it "returns 3 for '1,5'" do
        expect(calculator.add("1,5")).to eq(6)
      end
  
      it "returns 6 for '1,2,3'" do
        expect(calculator.add("1,2,3")).to eq(6)
      end
  
      it "returns 6 for '1,2,3,4'" do
        expect(calculator.add("1,2,3,4")).to eq(10)
      end
    end

    context "for newline separated numbers" do
      it "returns 6 for '1\n2,3'" do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end
  end
end
