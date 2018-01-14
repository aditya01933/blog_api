require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe 'GET /articles/{id}' do
    context 'when article found' do
      it 'returns the specified article' do
        user = FactoryGirl.create(:user)
        article_id = FactoryGirl.create(:article, user_id: user.id).id

        get :show, params: { id: article_id }

        body = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(body['id']).to eq(article_id)
      end
    end

    context 'when article not found' do
      it 'returns 404 not found status' do
        get :show, params: { id: 'fake_id' }
        expect(response.status).to eq 404
      end
    end
  end
end
