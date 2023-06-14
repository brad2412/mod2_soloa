require "rails_helper"

RSpec.describe "Merchant Coupons Index", type: :feature do
  let!(:merchant) { Merchant.create!(name: "Sample Merchant") }
  let!(:coupon) { Coupon.create!(name: "Sample Coupon", code: "ABC123", value: 10, amount_type: "Percent", merchant: merchant, active: true) }

  describe "Viewing a merchant's coupons" do
    it "displays the merchant's name and coupons" do
      visit merchant_coupons_path(merchant)

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(coupon.name)
    end
  end
end


