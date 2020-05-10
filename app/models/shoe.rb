class Shoe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews 
    
    validates :model, uniqueness: true
    validates :model, :brand, presence: true

    scope :ordered_model, -> { order(model: :asc) }
end
