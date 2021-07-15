class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :validate

    def validate
        @clickbait = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [1-9]/]

        if @clickbait.none? {|clickbait| clickbait.match(self.title)}
                errors.add(:title, "Title must be clickbait")
        end
    end 

end
