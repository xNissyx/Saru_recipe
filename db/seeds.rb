# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

Tag.create!(
  [
    {name: '火を使わない'},
    {name: '包丁を使わない'},
    {name: '10分以内でできる'}
  ]
)

users = User.create!(
  [
    {email: 'Alice@example.com', name: 'Alice', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'Bob@example.com', name: 'Bob', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'Carol@example.com', name: 'Carol', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'Dave@example.com', name: 'Dave', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'Ellen@example.com', name: 'Ellen', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'Frank@example.com', name: 'Frank', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")}
  ]
)

recipes = Recipe.create!(
  [
    {title: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe1.jpg"), filename:"sample-recipe1.jpg"), description: 'いかを串にさして焼くだけ', user_id: users[0].id},
    {title: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe2.jpg"), filename:"sample-recipe2.jpg"), description: 'レッドブルを注ぐだけ、これがないと一日が始まらない', user_id: users[1].id},
    {title: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe3.jpg"), filename:"sample-recipe3.jpg"), description: 'ソーセージを焼くだけ、電子レンジでもok（6本の場合で500W60秒、600W40秒）', user_id: users[2].id},
    {title: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe4.jpg"), filename:"sample-recipe4.jpg"), description: 'ご飯に卵をかける最高の飯', user_id: users[3].id},
    {title: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe5.jpg"), filename:"sample-recipe5.jpg"), description: '冷凍うどんを電子レンジで３分前後チンする。あとはお好みで', user_id: users[4].id},
    {title: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe6.jpg"), filename:"sample-recipe6.jpg"), description: '目玉焼き、蓋をして焼くとこんな感じでピンク色になる。', user_id: users[5].id}
  ]
)

Ingredient.create!(
  [
    {name: 'いか', quantity: '適量', recipe_id: recipes[0].id},
    {name: 'レッドブル', quantity: '１本', recipe_id: recipes[1].id},
    {name: 'ソーセージ', quantity: '好きなだけ', recipe_id: recipes[2].id},
    {name: 'ご飯', quantity: '適量', recipe_id: recipes[3].id},
    {name: '卵', quantity: '１個', recipe_id: recipes[3].id},
    {name: '冷凍うどん', quantity: '１玉', recipe_id: recipes[4].id},
    {name: 'たまご', quantity: '１～２個', recipe_id: recipes[5].id}
  ]
)