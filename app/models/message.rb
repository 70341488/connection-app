class Message < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefectures

  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :title, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
