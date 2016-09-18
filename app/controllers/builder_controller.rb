class BuilderController < ApplicationController
  def new
    @user = User.new
    credit = @user.credits.build
    (credit.period || 6).times {credit.credit_payments.build}
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :root
    else
      render action: :new
    end
  end

private

  def user_params
    params.
        require(:user).
        permit(:name,
               credits_attributes:
                   [
                       :amount,
                       :duration,
                       :period,
                       :annual_rate_base,
                       :annual_rate_delay,
                       credit_payments_attributes: [
                           :amount
                       ]
                   ])
  end
end