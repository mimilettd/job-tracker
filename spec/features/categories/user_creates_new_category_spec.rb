require "rails_helper"

RSpec.feature "User creates new category" do
  scenario "a user can create a new category" do

    category = "Business Analyst"

    visit new_category_path

    fill_in "Title", with: category

    click_button "Create Category"

    expect(current_path).to eq(category_path(id: 1))
    expect(page).to have_content(category)
  end
end
