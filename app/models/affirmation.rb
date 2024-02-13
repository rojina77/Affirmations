class Affirmation < ApplicationRecord
    has_many :emotion_affirmations
    belongs_to :emotion
    validates :content, presence: true
end
