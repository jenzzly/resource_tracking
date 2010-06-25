class FundingFlowsController < ApplicationController
  @@shown_columns = [:from, :to,  :project, :committment_to, :spending_to]
  @@create_columns = [:from, :to,  :project, :committment_to, :disbursement_to, :spending_to]
  
  active_scaffold :funding_flow do |config|
    config.columns =  @@shown_columns
    list.sorting = {:from => 'DESC'}

    config.nested.add_link("Comments", [:comments])
    config.columns[:comments].association.reverse = :commentable

    config.create.columns = @@create_columns
    config.update.columns = config.create.columns
    [:from, :to, :project].each do |c|
      config.columns[c].inplace_edit = true
      config.columns[c].form_ui = :select
    end
    config.columns[:committment_to].inplace_edit = true
    config.columns[:disbursement_to].inplace_edit = true
    config.columns[:spending_to].inplace_edit = true
    [:committment_to, :disbursement_to]. each do |c|
      config.columns[c].label = c.to_s.split("_").first.capitalize + " from donor"
    end
    config.columns[:spending_to].label = "Amount Spent"
  end

  def index

  end
end
