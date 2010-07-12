class User < ActiveRecord::Base

    acts_as_authentic

  has_many  :assignments
  has_many :roles, :through => :assignments

   #named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

   #ROLES = %w[admin moderator author editor]

   #def roles=(roles)
     #self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
   #end

   #def roles
    # ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
   #end

  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :email, :case_sensitive => false

  #password validations
  # creates virtual attribute password_confirmation
  validates_confirmation_of :password

  validates_presence_of :password
  validates_length_of :password, :minimum => 8

  #def role?
   #  roles.include? role.to_s
  #end

    def role_symbols
     [:admin] if admin?
     roles.map do |role|
       role.name.underscore.to_sym
      end
   end


end

