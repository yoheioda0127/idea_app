class Idea < ApplicationRecord
  belongs_to :category

  validates :body, presence: true, length: { maximum: 300 }
  validates :category_id, presence: true, numericality: { message: 'の選択を行ってください。' }
end
