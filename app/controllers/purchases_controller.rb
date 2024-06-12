class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :house_num, :building_name, :tel_num).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def move_to_index
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end
end
