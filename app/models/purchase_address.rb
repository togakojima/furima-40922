class PurchaseAddress
  include ActiveModel::Model 
  attr_accessor :postcode, :prefecture_id, :city, :house_num, :building_name, :tel_num, :item_id, :user_id

  with_options presence: true do
    validates :city, :house_num, :user_id 
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :tel_num, format: {with: /¥A¥d{10.11}¥z/, message: "is invalid. Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcoad, prefecture_id: prefecture_id, house_num: house_num, building_name: building_name, tel_num: tel_num, purchase_id: purchase.id)
  end
end