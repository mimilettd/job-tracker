require 'rails_helper'

RSpec.feature "User deletes a category" do
  scenario "user can delete a category" do
    category_1 = create(:category)
    category_2 = create(:category)

    visit categories_path
    page.first(:link, "Delete").click

    expect(page).to_not have_content(category_1.title)
    expect(page).to have_content(category_2.title)
  end
end
