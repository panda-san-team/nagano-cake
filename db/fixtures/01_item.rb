item = Item.new(
            genre_id: 1,
            name: 'チョコブラウニー',
            introduction: 'クーベルチョコレートをたっぷり使ったちょっと贅沢したい時にピッタリのブラウニーです。',
            price: 560,
            is_active: true
  )
item.image.attach(io: File.open(Rails.root.join("./app/assets/images/ブラウニー.jpeg")), filename:'ブラウニー.jpeg')
item.save!

item = Item.new(
            genre_id: 1,
            name: 'レモンケーキ',
            introduction: 'アールグレイの紅茶にとってもお似合いのレモンケーキをご用意しました。',
            price: 400,
            is_active: true
  )
item.image.attach(io: File.open(Rails.root.join("./app/assets/images/レモンケーキ.jpeg")), filename:'レモンケーキ.jpeg')
item.save!

item = Item.new(
            genre_id: 1,
            name: 'いちごのホールケーキ',
            introduction: 'あまおういちごをたっぷり使ったホールケーキです。',
            price: 3600,
            is_active: true
  )
item.image.attach(io: File.open(Rails.root.join("./app/assets/images/いちごのホールケーキ.jpeg")), filename:'いちごのホールケーキ.jpeg')
item.save!

item = Item.new(
            genre_id: 1,
            name: 'チョコレートカップケーキ',
            introduction: '優雅なおやつの時間を過ごせます。',
            price: 150,
            is_active: true
  )
item.image.attach(io: File.open(Rails.root.join("./app/assets/images/カップケーキ.jpeg")), filename:'カップケーキ.jpeg')
item.save!

item = Item.new(
            genre_id: 1,
            name: 'いちごのホワイトロールケーキ',
            introduction: '甘さ控えめのホワイトチョコがクセになる口当たりが軽いロールケーキです。',
            price: 800,
            is_active: true
  )
item.image.attach(io: File.open(Rails.root.join("./app/assets/images/ロールケーキ.jpeg")), filename:'ロールケーキ.jpeg')
item.save!

