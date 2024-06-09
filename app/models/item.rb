class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status 
  belongs_to :fee 
  belongs_to :prefecture 
  belongs_to :schedule

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :category_id, :status_id, :fee_id, :prefecture_id, :schedule_id, numericality: {other_than: 1, message: "can't be blank"}
  end


end
