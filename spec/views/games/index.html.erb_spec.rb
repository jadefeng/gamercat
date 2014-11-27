require 'rails_helper'

RSpec.describe "games/index", :type => :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :game_name => "Game Name"
      ),
      Game.create!(
        :game_name => "Game Name"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Game Name".to_s, :count => 2
  end
end
