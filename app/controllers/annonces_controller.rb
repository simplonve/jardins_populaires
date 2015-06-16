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
		@annonces = Annonce.all
	end
	def show
    	@annonce = Annonce.find(params[:id])
 	end	
	private
	  def annonce_params
	    params.require(:annonce).permit(:categorie,:sous_categorie,:titre,:code_postal,:adresse,:dispo,:quantite,:commentaire, :img)
	  end	
end