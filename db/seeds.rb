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
      # body: "本文#{n}"
      body: "駅のホームにて酔っぱらって妙なテンションになってた俺はおもむろにその場で構えをとって
            「波動拳！！」
            そしたら向かいのホームにいた見知らぬ男が「う～わ～！」と吹っ飛んだ
            すると、その隣にいた男が高らかに「ＫＯ！！」
            そしてこちらを指さして「ＹＯＵ　ＷＩＮ！！」
            更には「ラウンド２　ファイッ！！」
            その声に吹っ飛んだ男が跳ね起きる
            こちらも第２射を放とうとした瞬間、電車が来た
            乗り込んだ時に、騒音に混じって微かに
            「ドロー！」の声が聞こえた

            そしたら向かいのホームにいた見知らぬ男が

            酔っぱらうとつい勢いで行動してしまいますよね？

            この人のように、勢いあまって恥ずかしいことをしてしまった経験もあるでしょう。

            しかし、その後の展開が面白くて、恥ずかしい言動を見た人もノッてきます。

            まさかの展開が巻き起こっていて、現場にいたら確実に笑いますよね♪

            大人になっても少年心を忘れていないのは素敵ですね。

            "
    )
  end
end

AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )