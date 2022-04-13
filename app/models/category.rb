class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース衣類・用品' },
    { id: 3, name: 'メンズ衣類・用品' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'くつ' },
    { id: 11, name: 'アンティーク' },
    { id: 12, name: '食品' },
    { id: 13, name: '酒類' },
    { id: 14, name: 'サービス' },
    { id: 15, name: 'ハンドメイド' },
    { id: 16, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

end