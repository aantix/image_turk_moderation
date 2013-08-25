require 'spec_helper'

describe "image_moderations/show" do
  before(:each) do
    @image_moderation = assign(:image_moderation, stub_model(ImageModeration,
      :image_id => 1,
      :choice => "Choice"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Choice/)
  end
end
