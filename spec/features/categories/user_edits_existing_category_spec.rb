require 'rails_helper'

RSpec.feature "User edits existing category" do
  scenario "user can edit an existing category" do
    create_list(:category, 2)

    visit categories_path
    page.first(:link, "Edit").click

    fill_in "Title", with: "Accounting"
    click_button "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Accounting")
  end
end
