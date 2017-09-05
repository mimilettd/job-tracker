require 'rails_helper'

RSpec.feature "User visits dashboard" do
  scenario "User sees the count of jobs by city" do
    create_list(:job, 5)

    visit dashboard_index_path

    expect(page).to have_content(Job.first.city)
    expect(page).to have_content("1")
  end
  scenario "User sees top three companies" do
    job_1 = create(:job)
    job_2 = create(:job)
    job_3 = create(:job)

    visit dashboard_index_path

    expect(page).to have_content(job_1.company.name)
    expect(page).to have_content(job_2.company.name)
    expect(page).to have_content(job_3.company.name)
  end
end
