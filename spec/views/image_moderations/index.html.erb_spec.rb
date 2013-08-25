require 'spec_helper'

describe "image_moderations/index" do
  before(:each) do
    assign(:image_moderations, [
      stub_model(ImageModeration,
        :image_id => 1,
        :choice => "Choice"
      ),
      stub_model(ImageModeration,
        :image_id => 1,
        :choice => "Choice"
      )
    ])
  end

  it "renders a list of image_moderations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Choice".to_s, :count => 2
  end
end
