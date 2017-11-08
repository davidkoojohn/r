class Api::ConsumersController < Api::BaseResourceController
  acts_as_token_authentication_handler_for Consumer, except: [:create]

  def create
    raise ActionController::ParameterMissing.new('phone') unless consumer_params[:phone].present?
    raise ActionController::ParameterMissing.new('code') unless consumer_params[:code].present?
    raise ActionController::ParameterMissing.new('password') unless consumer_params[:password].present?
    raise ActionController::ParameterMissing.new('password_confirmation') unless consumer_params[:password_confirmation].present?

    @consumer = Consumer.where(phone: consumer_params[:phone])

    if @consumer.present?
      render :consumer_not_exist, status: 409
    elsif consumer_params[:password] != consumer_params[:password_confirmation]
      render :passwords_not_same, status: 407
    else
      @consumer = Consumer.create!(phone: consumer_params[:phone],
                                   password: consumer_params[:password],
                                   password_confirmation: consumer_params[:password_confirmation])
      render :logged_in, status: 200
    end
  end

  private
  def consumer_params
    params.require(:consumer)
  end
end

