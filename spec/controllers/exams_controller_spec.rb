require "rails_helper"

describe ExamsController do
  let!(:user){FactoryGirl.create :user}
  let!(:subject){FactoryGirl.create :subject}
  let!(:exam){FactoryGirl.create :exam, user: user, subject: subject}

  describe "GET show if signed in" do
    before{sign_in user}
    before{get :show, subject_id: subject.id, id: exam}
    it{expect(response).to be_success}
    it{expect(response).to have_http_status 200}
    it{expect(response).to render_template :show}
  end

  describe "Do not GET show if not signed in " do
    before{get :show, subject_id: subject.id, id: exam}
    it{expect(response).not_to be_success}
    it{expect(response).not_to have_http_status 200}
    it{expect(response).not_to render_template :show}
  end

  describe "POST create" do
    context "valid attributes" do
      before do
        sign_in user
        post :create, subject_id: subject.id,
        exam: FactoryGirl.attributes_for(:exam, user_id: user.id, subject_id: subject.id)
      end
      it{expect(response).to redirect_to [subject, subject.exams.last]}
      it{expect(flash[:success]).to be_present}
    end
  end
end
