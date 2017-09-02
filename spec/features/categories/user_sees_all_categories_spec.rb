require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "a user sees all categories" do
    category_1 = create(:category)
    category_2 = create(:category)
    category_3 = create(:category)

    visit categories_path

    expect(page).to have_link(category_1.title, :href=>category_path(category_1))
    expect(page).to have_link(category_2.title, :href=>category_path(category_2))
    expect(page).to have_link(category_3.title, :href=>category_path(category_3))
  end
end
