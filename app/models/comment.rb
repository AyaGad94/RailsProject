class Comment < ApplicationRecord

#Validations
validates :content, presence: true


#Relations Ships
belongs_to :user
belongs_to :lecture



end
