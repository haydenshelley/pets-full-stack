class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render :index
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    render :show
  end

  def new
    @pet = Pet.new
    render :new
  end

  def create
    @pet = Pet.create(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image]
    )
    redirect_to "/pets"
  end

  def edit
    @pet = Pet.find_by(id: params[:id])
    render :edit
  end

  def update
    @pet = Pet.find_by(id: params[:id])
    @pet.update(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image]
    )
    redirect_to "/pets"
  end
  
end