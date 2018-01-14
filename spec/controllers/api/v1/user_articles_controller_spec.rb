require 'rails_helper'

RSpec.describe Api::V1::UserArticlesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @articles = FactoryGirl.create(:article, user_id: @user.id)
  end

  # {'owner_name': "matz", "articles": [{"id":"1", "name":"iPhone 12SC Plus",
  # "price":"42000$", "description":"this is a revolution"}, {...}]}
  describe 'GET /owner_name/articles ' do
    it 'returns article belongs particle owner' do
      user_name = @user.name

      get :index, params: { owner_name: user_name }

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body['owner_name']).to include(@user.name)
      expect(body['articles'].count).to be > 0
    end

    it 'returns 404 if user not found' do
      get :index, params: { owner_name: 'fakename' }

      expect(response.status).to eq 404
    end
  end
end
