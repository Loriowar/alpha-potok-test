class HomeController < ApplicationController
  def index
    @decorator = HomeCalculationOperation.new(params)
  end

  def calculate
    @decorator = HomeCalculationOperation.new(params)

    if @decorator.valid?
      @decorator.calculate!
    end

    render action: :index
  end
end