class Annonce < ActiveRecord::Base
	validates :titre, :adresse, :dispo, :quantite, presence: true
	validates :code_postal, presence: true, length: { is: 5 }, :numericality => true

	def self.search(cat, code_postal)
		if is_tout?(cat)
			if is_partout?(code_postal)
				all.order(dispo: :asc)
			else
				where(code_postal: code_postal).order(dispo: :asc)
			end
		else
			if is_partout?(code_postal)
				where(categorie: cat).order(dispo: :asc)
			else
				where(categorie: cat, code_postal: code_postal).order(dispo: :asc)
			end			
		end
 	end

 	def self.is_tout?(cat)
 		cat == 'Tout'
 	end

 	def self.is_partout?(code_postal)
 		code_postal == ''
 	end

	def self.search_other(cat, code_postal)
		if !is_tout?(cat) && !is_partout?(code_postal)
			Annonce.find_by_sql("SELECT * FROM annonces WHERE annonces.code_postal = '#{code_postal}' AND annonces.categorie != '#{cat}' ORDER BY annonces.dispo DESC")
		end
	end
end
