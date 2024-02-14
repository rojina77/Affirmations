class AffirmationsController < ApplicationController
  def new
    @affirmation = Affirmation.new
  end

  def index
    @affirmations = Affirmation.all
  end

  def show
    @affirmation = Affirmation.find_by(id: params[:id])
    if @affirmation.nil?
      flash[:alert] = "Affirmation not found"
      redirect_to affirmation_path
    end
  end
  
  def create
    @affirmation = Affirmation.new(affirmation_params)

    if @affirmation.save
      redirect_to @affirmation, notice: 'Affirmation was successfully created.'
    else
      render :new
    end
  end

  def edit
    @affirmation = Affirmation.find(params[:id])
  end
  
  def update
    @affirmation = Affirmation.find(params[:id])
    if @affirmation.update(affirmation_params)
      redirect_to @affirmation, notice: 'Affirmation was successfully updated.'
    else
      render :edit
    end
  end
  

  def delete
    @affirmation.destroy
    redirect_to affirmations_url, notice: "Affirmation was successfully deleted."
  end

  private

  def set_affirmation
    @affirmation = Affirmation.find(params[:id])
  end

  def affirmation_params
    params.require(:affirmation).permit(:content, :emotion_id)
  end
end
