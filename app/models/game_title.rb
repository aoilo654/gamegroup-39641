class GameTitle < ActiveHash::Base
  self.data = [
    { id: 1, name: 'グランブルーファンタジー', image_path: 'grablulogo.png'},
    { id: 2, name: 'プリンセスコネクトRe:Dive', image_path: 'priconelogo.png'},
    { id: 3, name: 'ウマ娘プリティーダービー', image_path: 'umamusumelogo.png'}
  ]

  include ActiveHash::Associations
  has_many :games
end