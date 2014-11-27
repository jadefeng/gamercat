require 'rails_helper'

RSpec.describe "games/show", :type => :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :game_name => "Game Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Game Name/)
  end
end
