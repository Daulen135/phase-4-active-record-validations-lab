require 'pry'
class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    

    validate :clickbait?
   PATTERNS = [/You Won't Believe These True Facts/i]

    def clickbait?
        # binding.pry
       if  PATTERNS.none?{|pattern|pattern.match title}
    
        errors.add(:title, "Invalid!")
      end
    end




end
