require "rails_helper"

feature "User signs in" do
  let(:user){FactoryGirl.create :user}

  scenario "with valid credentials" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "sign_in"

    expect(page).to have_content(I18n.t "devise.sessions.signed_in")
  end

  scenario "with invalid credentials" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "other_password"
    click_button I18n.t "sign_in"

    expect(page).not_to have_content(I18n.t "devise.sessions.signed_in")
  end
end
