class Category < ApplicationRecord
  has_many :ideas

  validates :name, presence: true, length: { maximum: 8, message: 'は8文字以内です。' }
end
