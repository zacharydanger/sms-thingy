require 'rails_helper'

RSpec.describe "Subscribers", type: :request do
  describe "GET #index" do
    it "returns http success" do
      get "/subscribers"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    xit "returns http success" do
      get "/subscribers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
