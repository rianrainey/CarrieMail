require 'spec_helper'

describe "orders/edit.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user_id => 1,
      :ip_address => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :card_type => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_user_id", :name => "order[user_id]"
      assert_select "input#order_ip_address", :name => "order[ip_address]"
      assert_select "input#order_first_name", :name => "order[first_name]"
      assert_select "input#order_last_name", :name => "order[last_name]"
      assert_select "input#order_card_type", :name => "order[card_type]"
    end
  end
end
