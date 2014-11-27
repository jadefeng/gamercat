require 'rails_helper'

RSpec.describe "plays/new", :type => :view do
  before(:each) do
    assign(:play, Play.new(
      :user_id => 1,
      :score => 1,
      :game_id => 1
    ))
  end

  it "renders new play form" do
    render

    assert_select "form[action=?][method=?]", plays_path, "post" do

      assert_select "input#play_user_id[name=?]", "play[user_id]"

      assert_select "input#play_score[name=?]", "play[score]"

      assert_select "input#play_game_id[name=?]", "play[game_id]"
    end
  end
end
