require 'spec_helper'

describe "notes/new.html.erb" do
  before(:each) do
    assign(:note, stub_model(Note,
      :catalog_id => 1,
      :title => "MyString",
      :body => "MyText",
      :recipient_id => 1
    ).as_new_record)
  end

  it "renders new note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path, :method => "post" do
      assert_select "input#note_catalog_id", :name => "note[catalog_id]"
      assert_select "input#note_title", :name => "note[title]"
      assert_select "textarea#note_body", :name => "note[body]"
      assert_select "input#note_recipient_id", :name => "note[recipient_id]"
    end
  end
end
