require "rails_helper"

feature "In Question View" do
  let(:user){FactoryGirl.create :user}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "sign_in"
    click_link I18n.t "questions"
  end

  scenario "form modal should visible after button click", :js => true do
    click_button I18n.t "suggest_question"
    expect(page).to have_css("div.modal.fade.in")
  end

  scenario "form modal should not disappear for invalid submit", :js => true do
    question = double("question", content: "something")
    click_button I18n.t "suggest_question"
    fill_in "Questions Content", with: question.content
    click_button "Submit"
    expect(page).to have_css("div.modal.fade.in")
  end
end
