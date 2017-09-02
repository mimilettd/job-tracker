require 'rails_helper'

RSpec.feature "User sees a category" do
  scenario "user visits category show page and sees all jobs associated" do
    category = create(:category)
    company_1 = create(:company)
    company_2 = create(:company)
    job_1 = category.jobs.create(title: "Waitress", description: "Serve stuff", level_of_interest: 10, city: "Los Angeles", company: company_1)
    job_2 = category.jobs.create(title: "Project Manager", description: "Manage stuff", level_of_interest: 70, city: "Manhattan Beach", company: company_2)

    visit category_path(category)

    expect(page).to have_link(job_1.title, :href=>category_job_path(category, job_1))
    expect(page).to have_link(job_2.title, :href=>category_job_path(category, job_2))
  end
end
