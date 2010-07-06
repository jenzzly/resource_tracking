class UserLevel < ActiveRecord::Migration
  def self.up
    remove_column:users,:user_level

  end

  def self.down
    add_column:users,:user_level,:string
  end
end

