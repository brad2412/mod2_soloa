class Coupon < ApplicationRecord
  belongs_to :merchant
  has_one :invoice

  validates_presence_of :name, :code, :value
  validates_uniqueness_of :code
  validates_numericality_of :value, greater_than: 0
end