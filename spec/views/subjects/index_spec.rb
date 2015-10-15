require "rails_helper"

feature "In Subject View" do
  let(:user){FactoryGirl.create :user}
  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t "sign_in"
    click_link I18n.t "subjects"
  end

  scenario "subjects Title should appear" do
    expect(page).to have_content I18n.t "all_subjects"
  end
end
