class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :value
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
    add_index :coupons, :code
  end
end
