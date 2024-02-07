# app/controllers/affirmations_controller.rb
class AffirmationsController < ApplicationController
    before_action :set_affirmation, only: [:show, :edit, :update, :destroy]
  
    def index
      @affirmations = Affirmation.all
    end
  
    def show
    end
  
    def new
      @affirmation = Affirmation.new
    end
  
    def edit
    end
  
    def create
      @affirmation = Affirmation.new(affirmation_params)
  
      if @affirmation.save
        redirect_to @affirmation, notice: 'Affirmation was successfully created.'
      else
        render :new
      end
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
  