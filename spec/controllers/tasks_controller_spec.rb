require "rails_helper"


RSpec.describe TasksController, :type => :controller do

  let!(:user) { create(:user) }
  let!(:task) { create(:task) }
  let!(:task1) { create(:task) }
  context 'for new' do
    it 'should render new' do
      session[:user_id] = user.id
      user.tasks << task
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:task)).to be_a_new(Task)
    end
    it 'should redirect to user login' do
      get :new
      expect(response).to redirect_to(root_url)
    end
    it 'should redirect to admin' do
      user.update(role: 1)
      session[:user_id] = user.id
      get :new
      expect(response).to redirect_to(admin_new_path)
    end
  end

  context 'for new_admin' do
    it 'should render new' do
      user.update(role: 1)
      session[:user_id] = user.id
      user.tasks << task
      get :admin_new
      expect(response).to render_template(:admin_new)
      expect(assigns(:task)).to be_a_new(Task)
      expect(assigns(:users)).to eq([user.email])
    end
    it 'should redirect to user login' do
      get :admin_new
      expect(response).to redirect_to(root_url)
    end
  end

  context 'should do create' do
    it 'should get task create success' do
      user.tasks << task
      session[:user_id] = user.id
      post :create, :task => { description: 'example', name: 'example' }
      expect(Task.last.name).to eq('example')
      expect(response).to redirect_to(users_show_user_path(user.id))
    end
    it 'should get task create error' do
      user.tasks << task
      session[:user_id] = user.id
      post :create, :task => { name: nil }
      expect(response).to render_template(:new)
    end
  end

  context 'should do  update' do
    it 'should get task update success' do
      user.tasks << task
      session[:user_id] = user.id
      post :update, id: task.id, :task => { description: 'example', name: 'example' }
      expect(task.reload.name).to eq('example')
      expect(response).to redirect_to(users_show_user_path(user.id))
    end
    it 'should get task  update error' do
      user.tasks << task
      session[:user_id] = user.id
      post :update, id: task.id, :task => { name: nil }
      expect(response).to render_template(:edit)
    end
  end

  context 'for edit' do
    it 'should render edit' do
      session[:user_id] = user.id
      get :edit, id: task.id
      user.tasks << task
      expect(response).to render_template(:edit)
      expect(assigns(:task)).to eq(task)
      expect(assigns(:current_user)).to eq(user)
    end
    it 'should redirect to user login' do
      get :edit, id: task.id
      expect(response).to redirect_to(root_url)
    end
    it 'should redirect to admin edit' do
      user.tasks << task
      user.update(role: 'admin')
      session[:user_id] = user.id
      get :edit, id: task.id
      expect(response).to redirect_to(admin_edit_path)
    end
  end

  context 'for admin edit' do
    it 'should render edit' do
      user.tasks << task
      user.update(role: 'admin')
      session[:user_id] = user.id
      get :admin_edit, format: task.id
      expect(response).to render_template(:admin_edit)
      expect(assigns(:task)).to eq(task)
      expect(assigns(:users)).to eq([user.email])
      expect(assigns(:current_user)).to eq(user)
    end

    it 'should redirect to root login' do
      get :admin_edit, format: task.id
      expect(response).to redirect_to(root_url)
    end
  end

  context 'for show' do
    it 'should render new' do
      session[:user_id] = user.id
      user.tasks << task
      get :show, id: task.id
      expect(response).to render_template(:show)
      expect(assigns(:task)).to eq(task)
    end
    it 'should redirect to task' do
      get :show, id: task.id
      expect(response).to redirect_to(root_url)
    end
    it 'should redirect to admin show' do
      user.update(role: 1)
      session[:user_id] = user.id
      get :show, id: task.id
      expect(response).to redirect_to(admin_show_path(id: task.id))
    end
  end

  context 'for show_admin' do
    it 'should render show admin' do
      user.update(role: 1)
      session[:user_id] = user.id
      user.tasks << task
      get :admin_show, id: task.id
      expect(response).to render_template(:admin_show)
      expect(assigns(:task)).to eq(task)
    end
    it 'should redirect to root login' do
      get :admin_new, id: task.id
      expect(response).to redirect_to(root_url)
    end
  end

  it 'should index' do
    get :index
    expect(assigns(:tasks)).to eq(Task.all)
  end

  context 'for state_changen' do
    # it 'should render show admin' do
    #   user.update(role: 1)
    #   session[:user_id] = user.id
    #   user.tasks << task
    #   post :state_change, state: 'start', id: task.id
    #   task.reload
    #   expect(assigns(:task)).to eq(task)
    #   expect(response).to render_template(:form_state_change)
    # end
    it 'should redirect to root login' do
      post :state_change, state: 'start', id: task.id
      expect(response).to redirect_to(root_url)
    end
    # it 'should render show user' do
    #   session[:user_id] = user.id
    #   user.tasks << task
    #   post :state_change, state: 'finished', id: task.id
    #   task.reload
    #   expect(assigns(:task)).to eq(task)
    #   expect(response).to render_template(:form_state_change)
    # end
  end
end