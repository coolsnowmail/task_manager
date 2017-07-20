require "rails_helper"

RSpec.describe Task, :type => :model do

  describe 'validations' do
    it { should belong_to :user }
    it { should validate_presence_of(:name) }
    it do
      should define_enum_for(:state).with({ 'new task' => 1, 'start' => 2, 'finished' => 3 })
    end
  end
end
