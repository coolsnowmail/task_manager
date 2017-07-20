require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show_user" do
    it "returns http success" do
      get :show_user
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show_admin" do
    it "returns http success" do
      get :show_admin
      expect(response).to have_http_status(:success)
    end
  end

end
