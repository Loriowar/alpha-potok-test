class CreditPayment < ApplicationRecord
  belongs_to :credit
  has_one :user, through: :credit

  validates :amount, :credit, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
