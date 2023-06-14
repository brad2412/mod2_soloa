class AddActiveToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :active, :boolean
  end
end
