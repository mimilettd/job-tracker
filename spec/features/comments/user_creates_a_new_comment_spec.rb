require 'rails_helper'

RSpec.feature "User creates a new comment" do
  scenario "user visits job show and posts a comment" do
    job = create(:job)
    company = job.company

    body = "Spoke to hiring manager, Jacob. Plan to follow up Monday."

    visit company_job_path(company, job)

    fill_in "Post a comment", with: body

    click_button "Submit"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(body)
  end
end
