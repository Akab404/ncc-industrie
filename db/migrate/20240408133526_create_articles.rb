class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :titre
      t.string :content
      t.date :publication_date
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
