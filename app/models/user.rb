class User < ApplicationRecord
  has_many :credits, dependent: :destroy
  has_many :credit_aggregate_infos

  validates :name, presence: true

  def credits_attributes=(attributes)
    attributes.each_pair do |_, credit_params|
      credits.build(credit_params)
    end
  end
end
