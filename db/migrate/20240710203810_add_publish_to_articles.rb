class AddPublishToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :publish, :boolean
  end
end
