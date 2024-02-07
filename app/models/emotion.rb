class Emotion < ApplicationRecord
    has_many :affirmations
    validates :name, presence: true, uniqueness: true
end
