require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    Company.create(name: "ESPN")
    visit companies_path

    page.first(:link, "Delete").click

    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
