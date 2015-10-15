require "rails_helper"

describe SubjectsController do
  let!(:user){FactoryGirl.create :user}

  describe "GET index if signed in" do
    before{sign_in user}
    before{get :index}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :index}
  end

  describe "Do not GET index if not signed in " do
    before{get :index}
    it{expect(response).not_to be_success}
    it{expect(response).not_to have_http_status 200}
    it{expect(response).not_to render_template :index}
  end
end
