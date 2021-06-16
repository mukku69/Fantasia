# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
  User.create!(
    name: "#{n}",
    email: "#{n}@a",
    password: "000000"
  )
end

User.all.each do |user|
  rand(0..3).times do |n|
    Post.create!(
      user_id: user.id,
      title: "タイトル#{n}",
      body: "本文#{n}"
    )
  end
end

AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  ) if Rails.env.development?