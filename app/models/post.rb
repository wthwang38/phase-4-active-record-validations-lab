class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: %w(Fiction Non-Fiction)
    validate :clickbait?

    CLICKBAIT= [
    "Won't Believe",
    "Secret",
    "Top",
    "Guess"
]
    def clickbait?
        if CLICKBAIT.none? { |pat| pat.match title}
            errors.add(:title, "must be clickbait")
        end
    end

    end

end
