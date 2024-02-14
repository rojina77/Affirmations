class EmotionsController < ApplicationController
    
  def index
    @emotions = Emotion.all
  end

  def show
    @emotion = Emotion.find_by(id: params[:id])
    if @emotion.nil?
      flash[:alert] = "Emotion not found"
      redirect_to emotions_path
    end
  end

  def new
    @emotion = Emotion.new
  end

  def edit
    @emotion = Emotion.find(params[:id])
  end

  def create
    @emotion = Emotion.new(emotion_params)

    if @emotion.save
      redirect_to @emotion, notice: 'Emotion was successfully created.'
    else
      render :new
    end
  end

  def update
    @emotion = Emotion.find(params[:id])
    if @emotion.update(emotion_params)
      redirect_to @emotion, notice: 'Emotion was successfully updated.'
    else
      render :edit
    end
  end
  
  def delete
    @emotion.destroy
    redirect_to emotions_url, notice: "Emotion was successfully deleted."
  end

  private

  def emotion_params
    params.require(:emotion).permit(:name, :intensity)
  end
end
