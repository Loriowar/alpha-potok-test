class CreditAggregateInfo < ApplicationRecord
  belongs_to :user
  belongs_to :credit

  class << self
    def total_historical_annual_rate
      pluck('SUM(annual_rate_real)/COUNT(annual_rate_real)').first
    end

    def total_expected_annual_rate
      # @todo: or hardcode as 0.3
      pluck('SUM(annual_rate_base)/COUNT(annual_rate_base)').first
    end
  end
end
