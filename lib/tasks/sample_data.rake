namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    70.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    user = User.first
    15.times do |i|
      content = Faker::Lorem.sentence(5)
      title = Faker::Lorem.sentence(5)
      user.entries.create!(content: content, title: title) 
    end

    user2 = User.second
    15.times do |i|
      content = Faker::Lorem.sentence(15)
      title = Faker::Lorem.sentence(5)
      user2.entries.create!(content: content, title: title) 
    end
    make_relationships
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end