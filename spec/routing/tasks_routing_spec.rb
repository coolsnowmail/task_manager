require 'rails_helper'

RSpec.describe TasksController, type: :routing do
  describe 'routing' do

    it 'routes to #state_change' do
      expect(post: '/state_change').to route_to('tasks#state_change')
    end

    it 'routes to #admin_edit' do
      expect(get: '/admin_edit').to route_to('tasks#admin_edit')
    end

    it 'routes to #admin_new' do
      expect(get: '/admin_new').to route_to('tasks#admin_new')
    end

    it 'routes to #admin_show' do
      expect(get: '/admin_show').to route_to('tasks#admin_show')
    end

    it 'routes to #index' do
      expect(get: '/tasks').to route_to('tasks#index')
    end

    it 'routes to #root' do
      expect(get: '/').to route_to('tasks#index')
    end

    it 'routes to #new' do
      expect(get: '/tasks/new').to route_to('tasks#new')
    end

    it 'routes to #show' do
      expect(get: '/tasks/1').to route_to('tasks#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tasks/1/edit').to route_to('tasks#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tasks').to route_to('tasks#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tasks/1').to route_to('tasks#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tasks/1').to route_to('tasks#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tasks/1').to route_to('tasks#destroy', id: '1')
    end
  end
end