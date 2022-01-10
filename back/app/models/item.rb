class Item < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 20}}
  validates :image_name, {presence: true}
  validates :user_id, {presence: true}
end
