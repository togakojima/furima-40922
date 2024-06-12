class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postcode, :prefecture_id, :city, :house_num, :building_name, :tel_num).merge(purchase_id: @purchase.id)
  end

end
