FactoryGirl.define do
  factory :task, class: 'Task' do
    sequence(:name) { |i| "name#{i}"}
    description 'description'
  end
end
