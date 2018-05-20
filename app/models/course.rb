class Course < ApplicationRecord

#validations
validates :title,  presence: true 
validates :title, uniqueness: true
#Relation Ships
belongs_to :user
has_many :lectures

end
