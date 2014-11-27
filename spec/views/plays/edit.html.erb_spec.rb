require 'rails_helper'

RSpec.describe "plays/edit", :type => :view do
  before(:each) do
    @play = assign(:play, Play.create!(
      :user_id => 1,
      :score => 1,
      :game_id => 1
    ))
  end

  it "renders the edit play form" do
    render

    assert_select "form[action=?][method=?]", play_path(@play), "post" do

      assert_select "input#play_user_id[name=?]", "play[user_id]"

      assert_select "input#play_score[name=?]", "play[score]"

      assert_select "input#play_game_id[name=?]", "play[game_id]"
    end
  end
end
