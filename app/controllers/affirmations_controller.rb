class AffirmationsController < ApplicationController

  def new
    @affirmation = Affirmation.new
  end

  def index
    @affirmations = Affirmation.all
  end

  def show 
    @affirmation = Affirmation.find(params[:id])
  end
  
  def create
    @affirmation = Affirmation.new(affirmation_params)

    if @affirmation.save
      redirect_to @affirmation, notice: 'Affirmation was successfully created.'
    else
      render :new
    end
  end

  def some_action
    @affirmations = Affirmation.all
    render 'affirmations/index'
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

  def generate_affirmation_for_mood(mood)
    # Implement logic to generate affirmations based on the mood
    # Example: Return a hardcoded affirmation for demonstration
    case mood.downcase
    when 'sad'
      'You are loved and valued.'
    when 'happy'
      'You radiate positivity and joy.'
    else
      'You are capable of overcoming any challenge.'
    end
  end
end


 