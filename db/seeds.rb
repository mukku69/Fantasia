# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |n|
  User.create!(
    name: Gimei.unique.name,
    email: "test#{n}@a",
    introduction: "はじめまして、よろしくお願いします",
    password: "000000"
  )
end

10.times do
   Genre.create!(
    name: Faker::Book.genre
  )
  end

User.all.each do |user|
  rand(1..10).times do |n|
    user.posts.create!(
      user_id: user.id,
      genre_id: rand(1..10),
      title: Faker::Book.title,
      body: "本文#{n}"
    )
  end
end

AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )