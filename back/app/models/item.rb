class Item < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 20}}
end
