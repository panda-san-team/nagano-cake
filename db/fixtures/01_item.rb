item = Item.new(
  genre_id: 1,
  name: 'レモンケーキ',
  introduction: 'アールグレイの紅茶にとってもお似合いのレモンケーキをご用意しました。',
  price: 400,
  is_active: true,
  )
item.image.attach(io: File.open("./app/assets/images/レモンケーキ.jpeg"), filename: "レモンケーキ.jpeg", content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 1,
  name: 'チョコブラウニー',
  introduction: 'クーベルチョコレートをたっぷり使ったちょっと贅沢したい時にピッタリのブラウニーです。',
  price: 560,
  is_active: true,
  )
item.image.attach(io: File.open("./app/assets/images/ブラウニー.jpeg"), filename: "ブラウニー.jpeg", content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 1,
  name: 'チョコレートカップケーキ',
  introduction: '優雅なおやつの時間を過ごせます。',
  price: 150,
  is_active: true,
  )
item.image.attach(io: File.open("./app/assets/images/カップケーキ.jpeg"), filename: "カップケーキ.jpeg", content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 1,
  name: 'いちごのホールケーキ',
  introduction: 'あまおういちごをたっぷり使ったホールケーキです。',
  price: 3600,
  is_active: true,
  )
item.image.attach(io: File.open("./app/assets/images/いちごのホールケーキ.jpeg"), filename: "イチゴのホールケーキ.jpeg", content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 1,
  name: 'いちごのホワイトロールケーキ',
  introduction: '甘さ控えめのホワイトチョコがクセになる口当たりが軽いロールケーキです。',
  price: 800,
  is_active: true,
  )
item.image.attach(io: File.open("./app/assets/images/ロールケーキ.jpeg"), filename: "ロールケーキ.jpeg", content_type: 'image/jpeg')
item.save!
