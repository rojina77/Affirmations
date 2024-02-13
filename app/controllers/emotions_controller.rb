# app/controllers/emotions_controller.rb
class EmotionsController < ApplicationController
    before_action :set_emotion, only: [:show, :edit, :update]
  
    def index
      @emotions = Emotion.all
    end
  
    def show
      @emotion = Emotion.find(params[:id])
      @affirmations = @emotion.affirmations
    end
  
    def new
      @emotion = Emotion.new
    end
  
    def edit
      @emotion = Emotion.find(params[:id])
    end
    

    def emotion_params
      params.require(:emotion).permit(:name, :emotions)
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
      if @emotion.update(emotion_params)
        redirect_to @emotion, notice: 'Emotion was successfully updated.'
      else
        render :edit
    end
  
    def destroy
      @emotion.destroy
      redirect_to emotions_url, notice: 'Emotion was successfully destroyed.'
    end
  
    private
  
    def set_emotion
      @emotion = Emotion.find(params[:id])
    end
  
    def emotion_params
      params.require(:emotion).permit(:name, :intensity)
    end
  end
end