class ProvidersController < ApplicationController

  @@columns_for_file_upload = %w[to raw_provider project ]
  map_fields :create_from_file,
    @@columns_for_file_upload,
    :file_field => :file

  def index
    @constraints = { :from => Organization.find_by_name("self").id } #current_user.organization.id
    @label = "Providers"
  end

  def create_from_file
    #TODO change application controller so that it's
    # create_from_file method accepts columns and optional
    # block of constraints, instead of using session
    @constraints = { :from => Organization.find_by_name("self").id } #current_user.organization.id
    super @@columns_for_file_upload, @constraints
  end

  def controller_model_class
    FundingFlow
  end
end
