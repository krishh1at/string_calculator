require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
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

    context "for custom delimiter" do
      it "returns 3 for '//;\n1;2'" do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it "returns 9 for '//|\n2|3|4'" do
        expect(calculator.add("//|\n2|3|4")).to eq(9)
      end

      it "returns 15 for '//-\n5-5-5'" do
        expect(calculator.add("//-\n5-5-5")).to eq(15)
      end
    end

    context "for negative numbers" do
      it "raises an exception for '-1'" do
        expect { calculator.add("-1") }.to raise_error(ArgumentError, "negative numbers not allowed: -1")
      end

      it "raises an exception for '-1,2,-3'" do
        expect { calculator.add("-1,2,-3") }.to raise_error(ArgumentError, "negative numbers not allowed: -1, -3")
      end

      it "raises an exception for '//|\n-2|3|-4'" do
        expect { calculator.add("//|\n-2|3|-4") }.to raise_error(ArgumentError, "negative numbers not allowed: -2, -4")
      end
    end
  end
end
