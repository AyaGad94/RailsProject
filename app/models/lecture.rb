class Lecture < ApplicationRecord

#validations
validates :content,  presence: true

#Relation Ships
belongs_to :course
belongs_to :user
has_many :comments

#Gems
acts_as_commontable
acts_as_votable

end
