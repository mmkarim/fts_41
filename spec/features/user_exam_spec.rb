require "rails_helper"

feature "In Exam Show" do
  let(:user){FactoryGirl.create :user}
  let!(:subject){FactoryGirl.create :subject}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "sign_in"
    click_link I18n.t "subjects"
    click_button I18n.t "start"
  end

  scenario "save button should appear" do
    expect(page).to have_button I18n.t "save"
  end

  scenario "finish button should appear" do
    expect(page).to have_button I18n.t "finish"
  end

  scenario "subjects title should appear" do
    expect(page).to have_content subject.title
  end

  scenario "resume button should appear if save clicked" do
    click_button I18n.t "save"
    expect(page).to have_button I18n.t "resume"
  end

  scenario "save button should appear if resume clicked" do
    click_button I18n.t "resume"
    expect(page).to have_button I18n.t "save"
  end

  scenario "result modal should not visible" do
    expect(page).to have_css("div.modal.fade")
  end

  scenario "after finish result modal should visible", js: true do
    click_button I18n.t "finish"
    expect(page).to have_css("div.modal.fade.in")
  end
end
