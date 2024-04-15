class Article < ApplicationRecord
  has_rich_text :content
  has_many_attached :photos
  has_one_attached :cover_image

  belongs_to :user
  attribute :content, :text

  CATEGORY = ["Sismique", "Etudes", "Certification", "Récompense"]
end
