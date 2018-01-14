class Api::V1::UserArticlesController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    render json: @user, custom_key: true
  end

  private

  # Setting up an user
  def set_user
    @user = User.includes(:articles).find_by(name: params[:owner_name])

    return head 404 unless @user.present?
  end
end
