require "rails_helper"

RSpec.feature "User creates new category" do
  scenario "a user can create a new category from category index" do

    category = "Business Analyst"

    visit new_category_path

    fill_in "Title", with: category
    click_button "Create Category"

    expect(current_path).to eq(category_path(id: 1))
    expect(page).to have_content(category)
  end

  scenario "a user creates a category that already exists" do

    category = create(:category)

    visit new_category_path
    fill_in "Title", with: category.title
    click_button "Create Category"

    expect(current_path).to eq(new_category_path)
  end

  scenario "a user creates a new category when creating a job" do
    company = create(:company)
    create_list(:category, 5)

    visit new_company_job_path(company)
    click_link "Create a New Category"

    fill_in "Title", with: "Front-End"
    click_button "Create Category"

    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content("Front-End")
  end
end
