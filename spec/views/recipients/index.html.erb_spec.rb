require 'spec_helper'

describe "recipients/index.html.erb" do
  before(:each) do
    assign(:recipients, [
      stub_model(Recipient,
        :user_id => 1,
        :note_id => 1,
        :first_name => "First Name",
        :last_name => "MyText",
        :street => "MyText",
        :addr_line2 => "MyText",
        :city => "MyText",
        :state => "MyText",
        :zip => "MyText",
        :email => "MyText"
      ),
      stub_model(Recipient,
        :user_id => 1,
        :note_id => 1,
        :first_name => "First Name",
        :last_name => "MyText",
        :street => "MyText",
        :addr_line2 => "MyText",
        :city => "MyText",
        :state => "MyText",
        :zip => "MyText",
        :email => "MyText"
      )
    ])
  end

  it "renders a list of recipients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
