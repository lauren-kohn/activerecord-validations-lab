class TitleValidator < ActiveModel::Validator

    def validate(record)
        unless record.title.match?(/Won't Believe/ || /Secret/ || /Top / || /Guess/)
                record.errors[:title] << "Must be more clickbait-y"
        end
    end 

end