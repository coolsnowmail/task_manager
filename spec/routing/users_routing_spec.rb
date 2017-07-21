require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do

    it 'routes to #show_user' do
      expect(get: 'users/show_user').to route_to('users#show_user')
    end

    it 'routes to #show_admin' do
      expect(get: 'users/show_admin').to route_to('users#show_admin')
    end
  end
end