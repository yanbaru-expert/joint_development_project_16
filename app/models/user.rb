class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: true, length: { maximum: 3}, numericality: { only_integer: true }
end
