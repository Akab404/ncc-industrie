class CreateJobOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :job_offers do |t|
      t.string :titre
      t.text :job_description
      t.string :geolocalisation
      t.string :job_type
      t.date :starting_date
      t.string :salary
      t.text :candidate_profil

      t.timestamps
    end
  end
end
