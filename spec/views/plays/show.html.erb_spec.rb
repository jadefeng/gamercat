require 'rails_helper'

RSpec.describe "plays/show", :type => :view do
  before(:each) do
    @play = assign(:play, Play.create!(
      :user_id => 1,
      :score => 2,
      :game_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
