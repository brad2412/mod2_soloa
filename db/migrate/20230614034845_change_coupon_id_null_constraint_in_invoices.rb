class ChangeCouponIdNullConstraintInInvoices < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :coupon_id, :bigint, null: true
  end
end
