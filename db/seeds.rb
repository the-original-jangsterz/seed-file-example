User.destroy_all
Article.destroy_all
Vote.destroy_all

names = ['Test', 'Bob', 'Jane', 'Lisa']

names.each do |name|
  user = User.create(
    name: name,
    email: "#{name}@#{name}.com".downcase,
    password: "password"
  )
  3.times do
    article = Article.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph(10),
      url: Faker::Internet.url,
      user_id: user.id
    )
  end
end

users = User.all
articles = Article.all

articles.each do |article|
  users.each do |user|
    Vote.create(
      user_id: user.id,
      article_id: article.id,
      value: [-1, 0, 1].sample
    )
  end
end

puts 'Done!'
