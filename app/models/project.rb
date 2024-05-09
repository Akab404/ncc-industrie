class Project < ApplicationRecord
  CATEGORY_PROJECT = ["Sismique", "Résistance des matériaux", "Calcul"]

  has_rich_text :content_problematic
  has_rich_text :content_solution

end
