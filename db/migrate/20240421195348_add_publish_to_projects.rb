class AddPublishToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :publish, :boolean
  end
end
