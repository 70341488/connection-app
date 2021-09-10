class Message < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefectures

  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :title
    validates :explanation
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}

end
