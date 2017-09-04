require "rails_helper"

RSpec.feature "User updates a job" do
  scenario "a user can update an existing job" do
    @job = create(:job)
    @company = @job.company

    visit company_job_path(@company, @job)

    click_link "Edit"
    fill_in "Title", with: "Software Engineer"
    click_button "Update"

    expect(current_path).to eq(job_path(@job))
    expect(page).to have_content("Software Engineer")
    expect(page).to have_content(@job.description)
    expect(page).to have_content(@job.level_of_interest)
    expect(page).to have_content(@job.city)
  end
end
