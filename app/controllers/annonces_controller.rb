class AnnoncesController < ApplicationController
	def new
		@annonce = Annonce.new
	end
	def create
		@annonce = Annonce.new(annonce_params)
		if @annonce.save
			redirect_to @annonce
  		else
    		render 'new'
  		end
  	end	
	def index
		@annonces = Annonce.last(3).reverse
	end
	def show
    	@annonce = Annonce.find(params[:id])
 	end	
 	def search
 		if params[:search] == 'Fruits'
 			@annonces = Annonce.fruits
 		elsif params[:search] == 'Légumes'
 			@annonces = Annonce.legumes
 		else
 			@annonces = Annonce.autres
 		end
 	end
	private
	  def annonce_params
	    params.require(:annonce).permit(:categorie,:titre,:code_postal,:adresse,:dispo,:quantite,:commentaire, :img, :don)
	  end	
end
