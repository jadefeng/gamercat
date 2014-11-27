require 'rails_helper'

RSpec.describe "plays/index", :type => :view do
  before(:each) do
    assign(:plays, [
      Play.create!(
        :user_id => 1,
        :score => 2,
        :game_id => 3
      ),
      Play.create!(
        :user_id => 1,
        :score => 2,
        :game_id => 3
      )
    ])
  end

  it "renders a list of plays" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
