class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '' },
    { id: 2, name: '本・音楽・ゲーム' },
    { id: 3, name: 'カフェ・レストラン・食事処' },
    { id: 4, name: '旅行' },
    { id: 5, name: 'ファッション' },
    { id: 6, name: '食品・日用品' },
    { id: 7, name: 'インテリア' },
    { id: 8, name: '家電' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :messages

  end