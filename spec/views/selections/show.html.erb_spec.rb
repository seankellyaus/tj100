require 'spec_helper'

describe "selections/show.html.erb" do
  before(:each) do
    @selection = assign(:selection, stub_model(Selection,
      :song_id => 1,
      :user_id => 1,
      :number1 => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
