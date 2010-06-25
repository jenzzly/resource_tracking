class ProjectsController < ApplicationController

  before_filter :require_user	

  @@shown_columns = [:name, :description,  :expected_total]
  @@create_columns = [:name, :description,  :expected_total, :locations]
  
  active_scaffold :project do |config|
    config.columns =  @@shown_columns
    list.sorting = {:name => 'DESC'}
    config.nested.add_link("Activities", [:activities])
    
    config.nested.add_link("Comments", [:comments])
    config.columns[:comments].association.reverse = :commentable
    
    config.create.columns = @@create_columns
    config.update.columns = config.create.columns
    config.columns[:name].inplace_edit = true
    config.columns[:description].inplace_edit = true
    config.columns[:description].form_ui = :textarea
    config.columns[:expected_total].inplace_edit = true
    config.columns[:expected_total].label = "Total Budgeted Amount"
    config.columns[:locations].form_ui = :select
    config.columns[:locations].label = "Districts Worked In"
  end
  
  def index

  end

  def to_label
    @s="Project: "
    if name.nil? || name.empty?
      @s+"<No Name>"
    else
      @s+name
    end
  end
end
