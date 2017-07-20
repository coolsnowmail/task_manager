namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

      User.create(email: "admin@site.ru",
        password: "123",
        password_confirmation: "123",
        role: 'admin')
    # Create 15 posts
    15.times do
      User.create do |user|
        user.email = Faker::Internet.email
        user.password = "123"
        user.password_confirmation = "123"
        user.role = 2

        rand(1..3).times do
          Task.create do |task|
            task.name = Faker::Lorem.sentence
            task.description = Faker::Lorem.paragraph
            user.tasks << task
          end
        end
      end
    end
  end
end