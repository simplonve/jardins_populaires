class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :categorie
      t.string :sous_categorie
      t.string :titre
      t.string :code_postal
      t.string :adresse
      t.string :dispo
      t.string :quantite
      t.string :commentaire
      t.string :img
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
