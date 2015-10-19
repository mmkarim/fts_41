require "rails_helper"

feature "After signs in" do
  let!(:admin){FactoryGirl.create :admin}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button I18n.t "sign_in"
  end

  scenario "Subjects link should appear" do
    expect(page).to have_link(I18n.t "subjects")
  end

  scenario "Questions link should appear" do
    expect(page).to have_link(I18n.t "questions")
  end

  scenario "Exams link should appear" do
    expect(page).to have_link(I18n.t "exam")
  end

  scenario "Results link should appear" do
    expect(page).to have_link(I18n.t "result")
  end

  scenario "Users link should appear" do
    expect(page).to have_link(I18n.t "users")
  end

  scenario "Answer link should not appear" do
    expect(page).not_to have_link(I18n.t "answer")
  end

  scenario "Dashboard link should appear" do
    expect(page).to have_link(I18n.t "dashboard")
  end

  scenario "User link should appear" do
    expect(page).to have_link(admin.email)
  end

  scenario "Sign Out link should appear" do
    expect(page).to have_link(I18n.t "log_out")
  end

  scenario "Sign In link should disappear" do
    expect(page).not_to have_link(I18n.t "sign_in")
  end
end
