class UsersController < ApplicationController
  @@shown_columns = [:username, :email,   :password, :password_confirmation, :roles]
  @@create_columns = [:username, :email,  :password, :password_confirmation, :roles]


  def self.create_columns
    @@create_columns
  end

  active_scaffold :user do |config|
    config.columns =  @@shown_columns
    list.sorting = {:username => 'DESC'}
    #config.nested.add_link("User", [:users])
    config.columns[:roles].form_ui = :select
    config.columns[:roles].label = "roles"

  end

  record_select :per_page => 20, :search_on => 'name', :order_by => "name ASC"



  def to_label
    @s="User: "
    if name.nil? || name.empty?
      @s+"<No Name>"
    else
      @s+name
    end
  end


end

