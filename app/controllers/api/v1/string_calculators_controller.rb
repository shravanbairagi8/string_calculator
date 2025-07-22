class Api::V1::StringCalculatorsController < ApplicationController
  def add
    calculator = StrCalculator.new
    result = calculator.add(params[:numbers])

    render json: { result: result }, status: :ok
  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
