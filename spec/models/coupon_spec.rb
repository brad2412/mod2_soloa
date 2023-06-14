RSpec.describe Coupon, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:value) }
  end

  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_one(:invoice) }
  end

  describe "instance methods" do
    it "should have a valid name" do
      coupon = Coupon.new(name: "Example Coupon", code: "ABC123", value: 10, merchant_id: 1)
      expect(coupon.name).to eq("Example Coupon")
    end
  end
end

