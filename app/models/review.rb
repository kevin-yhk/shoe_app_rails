class Review < ApplicationRecord
    belongs_to :shoe
    belongs_to :user
    
    validates :title, uniqueness: true
    validates :title, :review, presence: true
end
