require "rails_helper"

feature "After signs in" do
  let(:user){FactoryGirl.create :user}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "sign_in"
    click_link I18n.t "sign_out"
  end

  scenario "Subjects link should disappear" do
    expect(page).not_to have_link(I18n.t "subjects")
  end

  scenario "Questions link should disappear" do
    expect(page).not_to have_link(I18n.t "questions")
  end

  scenario "Sign Out link should disappear" do
    expect(page).not_to have_link(I18n.t "sign_out")
  end

  scenario "Sign Up link should appear" do
    expect(page).to have_link(I18n.t "sign_up")
  end

 scenario "Sign In link should appear" do
    expect(page).to have_link(I18n.t "sign_in")
  end
end
