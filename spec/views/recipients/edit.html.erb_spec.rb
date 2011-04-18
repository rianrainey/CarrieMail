require 'spec_helper'

describe "recipients/edit.html.erb" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :user_id => 1,
      :note_id => 1,
      :first_name => "MyString",
      :last_name => "MyText",
      :street => "MyText",
      :addr_line2 => "MyText",
      :city => "MyText",
      :state => "MyText",
      :zip => "MyText",
      :email => "MyText"
    ))
  end

  it "renders the edit recipient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipients_path(@recipient), :method => "post" do
      assert_select "input#recipient_user_id", :name => "recipient[user_id]"
      assert_select "input#recipient_note_id", :name => "recipient[note_id]"
      assert_select "input#recipient_first_name", :name => "recipient[first_name]"
      assert_select "textarea#recipient_last_name", :name => "recipient[last_name]"
      assert_select "textarea#recipient_street", :name => "recipient[street]"
      assert_select "textarea#recipient_addr_line2", :name => "recipient[addr_line2]"
      assert_select "textarea#recipient_city", :name => "recipient[city]"
      assert_select "textarea#recipient_state", :name => "recipient[state]"
      assert_select "textarea#recipient_zip", :name => "recipient[zip]"
      assert_select "textarea#recipient_email", :name => "recipient[email]"
    end
  end
end
