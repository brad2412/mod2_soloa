class Coupon < ApplicationRecord
  belongs_to :merchant
  has_many :invoices, dependent: :nullify

  validates_presence_of :name, :code, :value, :active, :amount_type
  validates_uniqueness_of :code
  validates_numericality_of :value, greater_than: 0

  def successful_invoice_count
    invoices.where(status: "completed").count
  end

  def used_count
    invoice_count - successful_invoice_count
  end

  private

  def invoice_count
    invoices.count
  end
end





