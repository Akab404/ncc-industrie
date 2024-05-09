class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.text :content_problematic
      t.text :content_solution

      t.timestamps
    end
  end
end
