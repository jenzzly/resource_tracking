require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
 
  test "providers for" do
    o=Organization.new(:name => "test")
    o.save
    o.locations.create(:short_display => "testl")
    o.save
    loc = o.locations.first
    assert loc != nil
    providers = Organization.providers_for([loc])
    assert providers.first == o
    assert providers.size == 1
    # test multiple
    o2 = loc.organizations.create(:name => "test2")
    providers = Organization.providers_for([loc])
    assert providers.size ==2
    assert providers.include? o
    assert providers.include? o2

  end

  should have_and_belong_to_many :locations
  test "has many out_flows" do
    o=Organization.new
    o.save
    assert o.out_flows == []
    f=o.out_flows.create
    assert FundingFlow.count == 1
    o.save
    o=Organization.find(o.id)
    f=FundingFlow.find(f.id)
    assert o.out_flows == [f]
  end
  test "has many in_flows" do
    o=Organization.new
    o.save
    assert o.in_flows == []
    f=o.in_flows.create
    assert FundingFlow.count == 1
    o.save
    o=Organization.find(o.id)
    f=FundingFlow.find(f.id)
    assert o.in_flows == [f]
  end
  test "has many projects donated to" do
    o=Organization.new
    o.save
    assert o.donor_for == []
    f=o.donor_for.create
    assert Project.count == 1
    o.save
    o=Organization.find(o.id)
    f=Project.find(f.id)
    assert o.donor_for == [f]
  end
  test "has many projects it implements" do
    o=Organization.new
    o.save
    assert o.implementor_for == []
    f=o.implementor_for.create
    assert Project.count == 1
    o.save
    o=Organization.find(o.id)
    f=Project.find(f.id)
    assert o.implementor_for == [f]
  end
end
