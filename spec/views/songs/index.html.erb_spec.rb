require 'spec_helper'

describe "songs/index.html.erb" do
  before(:each) do
    assign(:songs, [
      stub_model(Song,
        :name => "Name",
        :artist => "Artist",
        :place => 1
      ),
      stub_model(Song,
        :name => "Name",
        :artist => "Artist",
        :place => 1
      )
    ])
  end

  it "renders a list of songs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
