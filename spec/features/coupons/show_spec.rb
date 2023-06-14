require "rails_helper"

RSpec.describe "Coupon Show", type: :feature do
  let!(:merchant) { Merchant.create!(name: "Sample Merchant") }
  let!(:coupon) { Coupon.create!(name: "Sample Coupon", code: "ABC123", value: 10, merchant: merchant) }

  describe "Viewing a coupon" do
    it "displays the merchant's name and coupon details" do
      visit merchant_coupon_path(merchant, coupon)

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(coupon.name)
      expect(page).to have_content(coupon.code)
    end
  end
end

