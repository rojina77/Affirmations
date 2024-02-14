class Emotion < ApplicationRecord
    has_many :emotion_affirmations
    has_many :affirmations, through: :emotion_affirmations
    validates :name, presence: true, uniqueness: true
end
