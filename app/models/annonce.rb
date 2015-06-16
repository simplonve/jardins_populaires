class Annonce < ActiveRecord::Base
	scope :fruits, -> {where(categorie: 'Fruits')}
	scope :legumes, -> {where(categorie: 'Légumes')}
	scope :autres, -> {where(categorie: 'Autres')}
end
