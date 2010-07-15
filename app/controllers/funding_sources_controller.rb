class FundingSourcesController < ApplicationController

  @@columns_for_file_upload = %w[from raw_provider project ]

  map_fields :create_from_file,
    @@columns_for_file_upload,
    :file_field => :file

  def index
    @constraints = { :to => Organization.find_by_name("self").id } #current_user.organization.id
    @label = "Funding Sources"
  end

  def create_from_file
    #TODO change application controller so that it's
    # create_from_file method accepts columns and optional
    # block of constraints, instead of using session
    @constraints = { :to => Organization.find_by_name("self").id } #current_user.organization.id
    super @@columns_for_file_upload, @constraints
  end

  def controller_model_class
    FundingFlow
  end
end

