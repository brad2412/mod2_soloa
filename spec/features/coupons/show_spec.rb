require "rails_helper"

RSpec.describe "Coupon Show", type: :feature do
  let!(:merchant) { Merchant.create!(name: "Sample Merchant") }
  let!(:customer) { Customer.create!(first_name: "John", last_name: "Doe", address: "123 Main St", city: "City", state: "State", zip: 12345) }
  let!(:coupon) { Coupon.create!(name: "Sample Coupon", code: "ABC123", value: 10, amount_type: "Percent", merchant: merchant, active: true) }
  let!(:invoice) { coupon.invoices.create!(status: :completed, customer: customer) }

  describe "Viewing a coupon" do
    it "displays the merchant's name and coupon details" do
      visit merchant_coupon_path(merchant, coupon)

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(coupon.name)
      expect(page).to have_content(coupon.code)
    end

    it "displays the coupon's details on the show page" do
      visit merchant_coupon_path(merchant, coupon)
    
      expect(page).to have_content(coupon.name)
      expect(page).to have_content("Merchant: #{merchant.name}")
      expect(page).to have_content("Code: #{coupon.code}")
      expect(page).to have_content("Percent/Dollar Off: #{coupon.value}")
      expect(page).to have_content("Status: #{coupon.active ? 'Active' : 'Inactive'}")
      expect(page).to have_content("Times Used: #{coupon.successful_invoice_count}")
    end
  end
end


