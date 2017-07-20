require "rails_helper"

RSpec.describe User, :type => :model do

  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should have_many(:tasks).dependent(:destroy) }
    it do
      should define_enum_for(:role).with({ 'admin' => 1, 'user' => 2 })
    end
  end
end