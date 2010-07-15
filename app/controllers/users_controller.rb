class UsersController < ApplicationController



  @@shown_columns = [:username, :email,   :password, :password_confirmation ]
  @@create_columns = [:username, :email,  :password, :password_confirmation]


  def self.create_columns
    @@create_columns
  end

  active_scaffold :user do |config|
    config.columns =  @@shown_columns
    list.sorting = {:username => 'DESC'}
  end

  record_select :per_page => 20, :search_on => 'username', :order_by => "username ASC"



  def to_label
    @s="User: "
    if username.nil? || username.empty?
      @s+"<No Name>"
    else
      @s+username
    end
  end
end

