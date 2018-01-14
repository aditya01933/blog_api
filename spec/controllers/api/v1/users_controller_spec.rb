require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  # {"owners": [{"name":"matz"}, {...}]}
  describe 'GET /owners ' do
    it 'returns array of owners' do
      get :index

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body['owners'][0]['name']).to include(@user.name)
    end

    it 'returns empty array if no owners' do
      User.delete_all

      get :index
      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body['owners'].count).to eq 0
    end
  end

  # {"owner_name":"matz"}
  describe 'GET /owner_name ' do
    it 'returns owner information' do
      get :show, params: { owner_name: @user.name }
      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body['owner_name']).to include(@user.name)
    end
  end

  it 'returns 404 if not found' do
    get :show, params: { owner_name: 'fake_name' }

    expect(response.status).to eq 404
  end
end
