require 'rails_helper'

RSpec.feature "User visits dashboard" do
  scenario "user sees a count of jobs by level of interest" do
    create_list(:job, 5)
    3.times do
      Job.new(title: "Title", level_of_interest: 70, city: "Denver").save(validate: false)
    end

    visit dashboard_index_path

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("70")
    expect(page).to have_content("3")
  end
end
