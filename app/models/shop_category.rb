class ShopCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '衣類' },
    { id: 3, name: '食品' },
    { id: 4, name: '装飾品' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: 'サービス' },
    { id: 9, name: '創作品' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :shops

end