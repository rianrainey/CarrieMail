require 'spec_helper'

describe "notes/edit.html.erb" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :catalog_id => 1,
      :title => "MyString",
      :body => "MyText",
      :recipient_id => 1
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path(@note), :method => "post" do
      assert_select "input#note_catalog_id", :name => "note[catalog_id]"
      assert_select "input#note_title", :name => "note[title]"
      assert_select "textarea#note_body", :name => "note[body]"
      assert_select "input#note_recipient_id", :name => "note[recipient_id]"
    end
  end
end
