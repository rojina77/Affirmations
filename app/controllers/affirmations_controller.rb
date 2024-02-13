class AffirmationsController < ApplicationController
  before_action :set_affirmation, only: [:show, :edit, :update, :destroy]

  def new
    @affirmation = Affirmation.new
  end

  def index
    @affirmations = Affirmation.all
  end

  def show 
    # No need to find the affirmation again since set_affirmation is called before this action
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
    # No need to find the affirmation again since set_affirmation is called before this action
  end

  def update
    if @affirmation.update(affirmation_params)
      redirect_to @affirmation, notice: 'Affirmation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @affirmation.destroy
    redirect_to affirmations_url, notice: 'Affirmation was successfully destroyed.'
  end

  private

  def set_affirmation
    @affirmation = Affirmation.find(params[:id])
  end

  def affirmation_params
    params.require(:affirmation).permit(:content, :emotion_id)
  end
end
