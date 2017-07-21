require "rails_helper"


RSpec.describe SessionsController, :type => :controller do

  let!(:user) { create(:user) }
  let!(:user1) { create(:user) }
  context 'session new' do
    it 'should redirect_to user_path' do
      session[:user_id] = user.id
      get :new
      expect(response).to redirect_to(users_show_user_path(user.id))
    end
  end

  context 'user login create' do
    it 'should redirect_to login_url' do
      get :create
      expect(response).to redirect_to(login_url)
      expect(flash[:alert]).to eq('Wrong login or password')
    end

    it 'should redirect_to user' do
      get :create, email: user.email, password: user.password
      expect(response).to redirect_to(users_show_user_path(user.id))
    end
  end

  context 'user login destroy' do
    it 'should redirect_to user_path' do
      session[:user_id] = user.id
      get :destroy
      expect(response).to redirect_to(root_url)
      expect(session[:user_id]).to eq(nil)
    end
  end
end