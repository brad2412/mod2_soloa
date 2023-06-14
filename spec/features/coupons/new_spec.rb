require "rails_helper"

RSpec.describe "Creating a new coupon", type: :feature do
  let!(:merchant) { Merchant.create!(name: "Sample Merchant") }

  describe "Creating a new coupon" do
    before(:each) do
      Coupon.create!(name: "Existing Coupon", code: "XYZ123", value: 20, merchant: merchant, active: true)
      Coupon.create!(name: "Coupon 2", code: "XYZ2", value: 10, merchant: merchant, active: true)
      Coupon.create!(name: "Coupon 3", code: "XYZ3", value: 10, merchant: merchant, active: true)
      Coupon.create!(name: "Coupon 4", code: "XYZ4", value: 10, merchant: merchant, active: true)
      Coupon.create!(name: "Coupon 1", code: "XYZ1", value: 10, merchant: merchant, active: true)
      Coupon.create!(name: "Coupon 5", code: "XYZ5", value: 10, merchant: merchant, active: true)
    end

    xit "creates a new coupon and displays it on the coupon index page" do
      visit merchant_coupons_path(merchant)

      click_link "Create New Coupon"

      fill_in "Name", with: "New Coupon"
      fill_in "Code", with: "ABC123"
      fill_in "Value", with: "10"
      select "Dollar", from: "Amount Type"
      click_button "Submit"

      expect(page).to have_current_path(merchant_coupons_path(merchant))
      expect(page).to have_content("New Coupon")
    end

    xit "displays an error message when the coupon code is not unique" do
      visit merchant_coupons_path(merchant)

      click_link "Create New Coupon"

      fill_in "Name", with: "New Coupon"
      fill_in "Code", with: "XYZ123"
      fill_in "Value", with: 10
      select "Percent", from: "Amount Type"
      click_button "Submit"

      expect(page).to have_current_path(new_merchant_coupon_path(merchant))
      expect(page).to have_content("Code has already been taken")
    end

    xit "displays an error message when the merchant has the maximum number of active coupons" do
      visit merchant_coupons_path(merchant)

      click_link "Create New Coupon"

      fill_in "Name", with: "New Coupon"
      fill_in "Code", with: "XYZ6"
      fill_in "Value", with: 10
      select "Percent", from: "Amount Type"
      click_button "Submit"

      expect(page).to have_current_path(new_merchant_coupon_path(merchant))
      expect(page).to have_content("Merchant has reached the maximum number of active coupons")
    end
  end
end