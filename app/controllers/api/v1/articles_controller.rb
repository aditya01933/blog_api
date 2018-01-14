class Api::V1::ArticlesController < ApplicationController
  def show
    article = Article.includes(:user).find_by(id: params[:id])

    return head 404 unless article

    render json: article
  end
end
