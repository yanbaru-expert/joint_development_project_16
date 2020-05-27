class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: true, inclusion: { in: 0..150 }, numericality: { only_integer: true }
end
