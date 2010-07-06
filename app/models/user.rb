class User < ActiveRecord::Base
  has_many  :assignments
  has_many :roles, :through => :assignments

  acts_as_authentic

  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :email, :case_sensitive => false

  #password validations
  # creates virtual attribute password_confirmation
  validates_confirmation_of :password

  validates_presence_of :password
  validates_length_of :password, :minimum => 8
end

