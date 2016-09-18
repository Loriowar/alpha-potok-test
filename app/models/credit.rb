class Credit < ApplicationRecord
  belongs_to :user
  has_many :credit_payments, dependent: :destroy
  has_many :credit_aggregate_infos

  validates :amount, :duration, :period, :annual_rate_base, :annual_rate_delay, :user, presence: true
  validates :amount, :duration, :period, numericality: { greater_than: 0 }
  validates :annual_rate_base, :annual_rate_delay, numericality: {greater_than: 0, less_than_or_equal_to: 1}

  def credit_payments_attributes=(attributes)
    attributes.each_pair do |_, credit_payment_params|
      credit_payments.build(credit_payment_params)
    end
  end
end
