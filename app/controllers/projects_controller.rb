class ProjectsController < ApplicationController
  @@shown_columns = [:name, :description,  :expected_total]
  @@create_columns = [:name, :description,  :expected_total, :locations]
  def self.create_columns
    @@create_columns
  end
  @@columns_for_file_upload = @@shown_columns.map {|c| c.to_s} # TODO fix bug, >1 location won't work

  record_select :per_page => 20, :search_on => 'name', :order_by => "name ASC"

  map_fields :create_from_file,
    @@columns_for_file_upload,
    :file_field => :file

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

  self.set_active_scaffold_column_descriptions



  def create_from_file
    super @@columns_for_file_upload
  end


  def maps
    self.class.maps(Project)
  end

  def self.maps (project)
    [["Project", Project.new]] +
      (project && !project.new_record? ?
        [[project.title, project]] : [])
  end

end

