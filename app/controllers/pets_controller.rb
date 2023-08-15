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
      image: params[:pet][:image],
      user_id: current_user.id
    )
    redirect_to "/pets"
  end

  def edit
    @pet = Pet.find_by(id: params[:id])
    if @pet.user_id == current_user.id
      render :edit
    else
      redirect_to "/pets"
    end
  end

  def update
    @pet = Pet.find_by(id: params[:id])
    if @pet.user_id == current_user.id
      @pet.update(
        name: params[:pet][:name],
        breed: params[:pet][:breed],
        image: params[:pet][:image]
      )
      redirect_to "/pets"
    else
      redirect_to "/pets"
    end
  end

  def destroy
    @pet = Pet.find_by(id: params[:id])
    if @pet.user_id == current_user.id
      @pet.destroy
      redirect_to "/pets", status: :see_other
    else  
      redirect_to "/pets"
    end
  end

end