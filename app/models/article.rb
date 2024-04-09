class Article < ApplicationRecord
  belongs_to :user
  attribute :content, :text
end
