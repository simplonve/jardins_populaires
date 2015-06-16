class Annonce < ActiveRecord::Base
	def self.search(search)
 		where(categorie: search)
 	end
end
