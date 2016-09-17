class Credit < ApplicationRecord
  belongs_to :user
  has_many :credit_payments

  validates :amount, :duration, :period, :annual_rate_base, :annual_rate_delay, :user, presence: true
  validates :amount, :duration, :period, numericality: { greater_than: 0 }
  validates :annual_rate_base, :annual_rate_delay, numericality: true
end
