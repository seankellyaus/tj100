require 'spec_helper'

describe "selections/edit.html.erb" do
  before(:each) do
    @selection = assign(:selection, stub_model(Selection,
      :song_id => 1,
      :user_id => 1,
      :number1 => false
    ))
  end

  it "renders the edit selection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => selections_path(@selection), :method => "post" do
      assert_select "input#selection_song_id", :name => "selection[song_id]"
      assert_select "input#selection_user_id", :name => "selection[user_id]"
      assert_select "input#selection_number1", :name => "selection[number1]"
    end
  end
end
