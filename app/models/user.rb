class User < ApplicationRecord
  has_many :credits

  validates :name, presence: true
end
