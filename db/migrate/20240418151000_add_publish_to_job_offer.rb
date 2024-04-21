class AddPublishToJobOffer < ActiveRecord::Migration[7.1]
  def change
    add_column :job_offers, :publish, :boolean
  end
end
