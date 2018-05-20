class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#validations
validates :name, :gender, :password, :gender , presence: true
enum gender: {male: 0, female: 1, any: 2}
validates_presence_of :date_of_birth
validate :valid_date? 
mount_uploader :profile_picture
acts_as_voter
acts_as_commontator

#Relation Ships
has_many :lectures
has_many :courses
has_many :comments

#Methods
private
 def valid_date?
  format="%Y/%m/%d"
  Date.strptime(date_of_birth,format) rescue false
end

end
