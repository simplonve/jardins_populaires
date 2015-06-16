class Annonce < ActiveRecord::Base
	scope :fruits, -> {where(categorie: 'fruits')}
end
