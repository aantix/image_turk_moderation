require 'spec_helper'

describe "image_moderations/new" do
  before(:each) do
    assign(:image_moderation, stub_model(ImageModeration,
      :image_id => 1,
      :choice => "MyString"
    ).as_new_record)
  end

  it "renders new image_moderation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", image_moderations_path, "post" do
      assert_select "input#image_moderation_image_id[name=?]", "image_moderation[image_id]"
      assert_select "input#image_moderation_choice[name=?]", "image_moderation[choice]"
    end
  end
end
