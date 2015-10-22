require "rails_helper"

feature "In Question View" do
  let(:user){FactoryGirl.create :user}
  let!(:subject){FactoryGirl.create :subject}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "sign_in"
    click_link I18n.t "questions"
  end

  scenario "form modal should disappear for valid submit", js: true do
    question = double("question", content: "something")
    click_button I18n.t "suggest_question"
    fill_in "Questions Content", with: question.content
    click_button "Submit"
    expect(page).to have_css("div.modal.fade")
  end

  scenario "question should appear if valid submit", js: true do
    question = double("question", content: "something")
    click_button I18n.t "suggest_question"
    fill_in "Questions Content", with: question.content
    click_button "Submit"
    visit(current_path)
    expect(page).to have_content question.content
  end
end
