class JobOffer < ApplicationRecord
  has_rich_text :job_description
  attribute :job_description, :text

  has_rich_text :candidate_profil
  attribute :candidate_profil, :text

  JOB_TYPE = ["CDD", "CDI", "STAGE", "CONTRAT D'APPRENTISSAGE"]
end
