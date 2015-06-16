class Annonce < ActiveRecord::Base
	scope :fruits, -> {where(categorie: 'fruits')}
	scope :legumes, -> {where(categorie: 'légumes')}
	scope :autres, -> {where(categorie: 'autres')}
end
