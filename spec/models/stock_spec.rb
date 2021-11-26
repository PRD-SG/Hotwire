RSpec.describe Stock do
    describe "create and update Stockt" do
      context "qty must be greater than 0 and name cannot be empty." do
        subject { described_class.new(name: "pen", qty: 3) }
  
        it "when save should retrun true" do
          expect(subject.valid?).to be false
        end
      end
  
      context "Qty is less than 0 and the name is empty." do
        subject { described_class.new(name: "", qty: 0) }
        it "when save should return false" do
          expect(subject.valid?).to be false
        end
      end
  
      context "when qty id not integer" do
        subject { described_class.new(name: "pen", qty: 1.5) }
        it "should return false" do
          expect(subject.valid?).to be false
        end
      end
    end
  end