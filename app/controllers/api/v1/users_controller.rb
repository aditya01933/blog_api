module Api;module V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    # Pagination should be added here. (.all) query is expensive.
    def index
      users = User.all

      render json: users, include: [], adapter: :json, root: 'owners'
    end

    def show
      render json: @user, include: [], custom_key: true
    end

    private

    # Setting up a user
    def set_user
      @user = User.find_by(name: params[:owner_name])

      return head 404 unless @user
    end
  end
end;end
