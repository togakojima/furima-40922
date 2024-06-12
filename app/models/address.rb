class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :city, :house_num
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
