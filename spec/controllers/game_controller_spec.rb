require 'rails_helper'

RSpec.describe GameController, :type => :controller do

  describe "GET jumpy_cat" do
    it "returns http success" do
      get :jumpy_cat
      expect(response).to have_http_status(:success)
    end
  end

end
