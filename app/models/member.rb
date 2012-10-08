# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  middlename :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Member < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :middlename,
  					:password, :password_confirmation
  has_secure_password

  #before_save { |member| member.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
  			format: { with: VALID_EMAIL_REGEX },
  			uniqueness: { case_sensitive: false }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


end
