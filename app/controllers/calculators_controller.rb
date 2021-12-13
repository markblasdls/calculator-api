class CalculatorsController < ApplicationController
  def calculate
    calculation = CalculatorService.new(number_a: calculator_params[:A], number_b: calculator_params[:B],
                                        operation: calculator_params[:OPERATION])
    render json: { result: calculation.result }, status: :ok
  rescue CalculatorService::InvalidNumber, CalculatorService::InvalidOperation => e
    render json: { result: e.message }, status: :bad_request
  rescue StandardError
    render json: { message: 'Server Error' }, status: :internal_server_error
  end

  private

  def calculator_params
    params.permit(:A, :B, :OPERATION)
  end
end
