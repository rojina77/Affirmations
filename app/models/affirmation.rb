class Affirmation < ApplicationRecord
    belongs_to :emotion
    validates :content, presence: true
end
