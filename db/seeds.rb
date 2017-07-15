User.create!(nickname: "ymd",
             name:  "yamada",
             email: "yamada@sample.com",
             password:              "12345678",
             password_confirmation: "12345678",
             avatar: Faker::Avatar.image("sample", "50x50", "jpg"))

99.times do |n|
  name  = Faker::Name.name
  nickname  = Faker::StarWars.character
  email = "example-#{n+1}@sample.com"
  password = "password"
  avatar = Faker::Avatar.image("sample", "50x50", "jpg")
  User.create!(nickname: nickname,
               name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               avatar: avatar)
end

users = User.order(:created_at).take(6)

# マイクロポスト
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(content: content) }
end

# リレーションシップ
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each{ |followed| user.follow(followed)}
followers.each{ |follower| follower.follow(user)}
