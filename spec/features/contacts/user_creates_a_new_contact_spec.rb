require 'rails_helper'

RSpec.feature "User creates a new contact" do
  scenario "user creates a new contact for a specific company" do
    name = "Penelope Santorini"
    position = "Hiring Manager"
    email = "penelope@wooo.com"

    company = create(:company)

    visit company_path(company)

    fill_in "Name", with: name
    fill_in "Position", with: position
    fill_in "Email", with: email
    click_button "Submit"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(name)
    expect(page).to have_content(position)
    expect(page).to have_content(email)
  end
end
