class Affirmation < ApplicationRecord
    has_many :emotion_affirmations, dependent: :destroy
    belongs_to :emotion
    validates :content, presence: true
end
