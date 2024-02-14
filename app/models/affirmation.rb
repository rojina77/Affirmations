class Affirmation < ApplicationRecord
    has_many :emotion_affirmations, dependent: :destroy
    has_many :emotions, through: :emotion_affirmations
    belongs_to :emotion
    validates :content, presence: true
end
