class KittensController < ApplicationController
  require 'rest-client'
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html #normal html display index.html.erb
      format.xml {render xml: @kittens}
      format.json {render json: @kittens}
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash[:succes] = "Kitten created successfully"
      redirect_to root_url
    else
      flash[:notice] = "Unable to create kitten please try again"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
    
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten updated successfully"
      redirect_to @kitten
    else
      flash[:notice] = "Kitten not updated"
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten deleted"
    redirect_to root_url
  end

  private 

  def kitten_params
    params.require(:kitten).permit(:name,:age,:cuteness,:softness)
  end
end
