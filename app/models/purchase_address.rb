class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_num, :building_name, :tel_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :house_num, :user_id, :item_id
    validates :tel_num
  end
  validates :tel_num, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Enter numbers only (10~11 characters)' },
                      allow_blank: true

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(postcode:, prefecture_id:, city:, house_num:,
                   building_name:, tel_num:, purchase_id: purchase.id)
  end
end
