class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end


  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'You cocktail was successfully created.'
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: 'Cocktail was successfully destroyed.'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
