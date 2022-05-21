# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)

Item.create(
  genre_id: 1,
  name: 'チョコブラウニー',
  introduction: 'クーベルチョコレートをたっぷり使ったちょっと贅沢したい時にピッタリのブラウニーです。',
  price: 560,
  is_active: true,
  image: File.open("./app/assets/images/ブラウニー.jpeg")
  )

Item.create(
  genre_id: 1,
  name: 'レモンケーキ',
  introduction: 'アールグレイの紅茶にとってもお似合いのレモンケーキをご用意しました。',
  price: 400,
  is_active: true,
  image: File.open("./app/assets/images/レモンケーキ.jpeg")
  )

Item.create(
  genre_id: 1,
  name: 'いちごのホールケーキ',
  introduction: 'あまおういちごをたっぷり使ったホールケーキです。',
  price: 3600,
  is_active: true,
  image: File.open("./app/assets/images/いちごのホールケーキ.jpeg")
  )

Item.create(
  genre_id: 1,
  name: 'チョコレートカップケーキ',
  introduction: '優雅なおやつの時間を過ごせます。',
  price: 150,
  is_active: true,
  image: File.open("./app/assets/images/カップケーキ.jpeg")
  )

Item.create(
  genre_id: 1,
  name: 'いちごのホワイトロールケーキ',
  introduction: '甘さ控えめのホワイトチョコがクセになる口当たりが軽いロールケーキです。',
  price: 800,
  is_active: true,
  image: File.open("./app/assets/images/ロールケーキ.jpeg")
  )