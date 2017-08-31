require "rails_helper"

RSpec.feature "User deletes a job" do
  scenario "a user can delete an existing job" do
    @job = create(:job)
    @company = @job.company

    visit company_job_path(@company, @job)

    click_link "Delete"

    expect(current_path).to eq(company_jobs_path(@company))
    expect(page).to_not have_content(@job.title)
  end
end
