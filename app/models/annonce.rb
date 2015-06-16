class Annonce < ActiveRecord::Base
	def self.search(search, code_postal)
		if is_tout?(search)
			if is_partout?(code_postal)
				all
			else
				all.where(code_postal: code_postal)
			end
		else
			if is_partout?(code_postal)
				all.where(categorie: search)
			else
				where(categorie: search, code_postal: code_postal)
			end			
		end
 	end
 	def self.is_tout?(search)
 		search == 'Tout'
 	end
 	def self.is_partout?(code_postal)
 		code_postal == 'Partout'
 	end

end
