class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :titre, use: :slugged

  has_rich_text :content
  has_many_attached :photos
  has_one_attached :cover_image

  belongs_to :user
  attribute :content, :text

  validates :titre, presence: true
  validates :category, presence: true

  CATEGORY = ["Sismique", "Etudes", "Certification", "Récompense", "RSE"]
end
