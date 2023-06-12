# Validations & Displaying Error Message
# This is useful for validating invalid users' inputs

class Article < ApplicationRecord

    # This enable a good bit of automatic behaviour
    # For example, if you have an instance variable @article containing an article, you can 
    # retrieve all the comments belonging to that article as an array using @article.comments.
    has_many :comments

    # Title must be present. It must at least contain 1 non-whitespace character
    validates :title, presence: true

    # Body must be present. Also, It should be at least 10 characters long
    validates :body, presence: true, length: { minimum: 10 }

end
