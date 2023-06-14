class CouponsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @coupons = @merchant.coupons
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @coupon = Coupon.find(params[:id])
    @coupon.invoice_count = @coupon.successful_invoice_count
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @coupon = Coupon.new
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @coupon = @merchant.coupons.build(coupon_params)

    if @coupon.save
      redirect_to merchant_coupons_path(@merchant), notice: "Coupon created successfully."
    else
      render :new
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name, :code, :value, :amount_type)
  end
end
