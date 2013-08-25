require 'spec_helper'

describe "image_moderations/edit" do
  before(:each) do
    @image_moderation = assign(:image_moderation, stub_model(ImageModeration,
      :image_id => 1,
      :choice => "MyString"
    ))
  end

  it "renders the edit image_moderation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", image_moderation_path(@image_moderation), "post" do
      assert_select "input#image_moderation_image_id[name=?]", "image_moderation[image_id]"
      assert_select "input#image_moderation_choice[name=?]", "image_moderation[choice]"
    end
  end
end
