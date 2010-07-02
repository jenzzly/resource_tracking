class Activity < ActiveRecord::Base
  acts_as_commentable
  has_and_belongs_to_many :projects 
  has_and_belongs_to_many :indicators
  has_many :lineItems
  belongs_to :provider, :foreign_key => :provider_id, :class_name => "Organization"

  validates_presence_of :name
end
