class AddInvoiceCountToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :invoice_count, :integer
  end
end
