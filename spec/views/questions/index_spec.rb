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

  scenario "question Title should appear" do
    expect(page).to have_content I18n.t "questions"
  end

  scenario "search button appear" do
    expect(page).to have_button I18n.t "search"
  end

  scenario "suggest question button appear" do
    expect(page).to have_button I18n.t "suggest_question"
  end

  scenario "Form has submit field" do
    expect(find "#new_question").to have_button I18n.t "submit"
  end

  scenario "Form has content field field" do
    expect(find "#new_question").to have_field("Questions Content")
  end

  scenario "form modal should visible after button click" do
    click_button I18n.t "suggest_question"
    expect(page).to have_selector("#question-modal", visible: true)
  end

  scenario "form modal should not visible when cancel clicked" do
    click_button I18n.t "suggest_question"
    click_button I18n.t "cancel"
    expect(page).to have_selector("#question-modal", visible: false)
  end
end
