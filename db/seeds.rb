require 'faker'

10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password'
  )
end


User.all.each do |user|
  5.times do
    user.articles.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph
    )
  end
end
