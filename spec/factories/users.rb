FactoryGirl.define do
  factory :user, class: 'User' do
    sequence(:email) { |i| "name#{i}@site.com"}
    password '123'
    password_confirmation '123'
    role 2
  end
end