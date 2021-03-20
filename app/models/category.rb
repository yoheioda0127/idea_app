class Category < ApplicationRecord
  belongs_to :idea
  
  validates  :name,   presence: true, format:  { message: 'は必須内容です。' }, length: {maximum: 8, message: 'は8文字以内です。'}
  end
