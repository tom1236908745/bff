class Item < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 20}}
  validates :image_name, {presence: true}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
