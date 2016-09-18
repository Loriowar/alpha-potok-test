class HomeCalculationOperation
  # @note: further here must appear Trailblazer operation or ActiveInteraction

  attr_reader :initial_amount, :period

  def initialize(params)
    @initial_amount = params[:initial_amount].try(:to_f)
    @period = params[:period].try(:to_f)
  end

  # status methods

  def valid?
    [@initial_amount, @period].all?{|obj| obj.kind_of?(Numeric) && obj > 0}
  end

  def blank?
    [@initial_amount, @period, @expected_amount, @historical_amount].all?(&:nil?)
  end

  def calculated?
    [@expected_amount, @historical_amount].all?(&:present?)
  end

  # info methods

  def errors
    unless valid?
      I18n.t(:not_enough_params, scope: 'home_controller.errors')
    end
  end

  # action methods

  def calculate!
    if valid?
      @expected_amount ||= final_amount_calculation(CreditAggregateInfo.total_expected_annual_rate)
      @historical_amount ||= final_amount_calculation(CreditAggregateInfo.total_historical_annual_rate)
    end
  end

  # reader methods

  def expected_amount
    @expected_amount && @expected_amount.round(2)
  end

  def historical_amount
    @historical_amount && @historical_amount.round(2)
  end

private

  def final_amount_calculation(val)
    val * @initial_amount / 12 * @period
  end
end