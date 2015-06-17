class Annonce < ActiveRecord::Base
	def self.search(cat, code_postal)
		if is_tout?(cat)
			if is_partout?(code_postal)
				all
			else
				all.where(code_postal: code_postal)
			end
		else
			if is_partout?(code_postal)
				all.where(categorie: cat)
			else
				where(categorie: cat, code_postal: code_postal)
			end			
		end
 	end
 	def self.is_tout?(cat)
 		cat == 'Tout'
 	end
 	def self.is_partout?(code_postal)
 		code_postal == 'Partout'
 	end

end
