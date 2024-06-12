class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :schedule

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image, :title, :info
    validates :category_id, :status_id, :fee_id, :prefecture_id, :schedule_id,
              numericality: { other_than: 1, message: "can't be blank" }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is not a number' }
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999, message: 'must be an integer between 300 and 9999999' }, allow_blank: true
end
