require 'rails_helper'

RSpec.feature "User sees comments" do
  scenario "user visits job and sees all comments associated with that job" do
    job = create(:job)
    company = job.company
    comment_1 = job.comments.create(body: "I am a comment!")
    comment_2 = job.comments.create(body: "You are a comment!")
    comment_3 = job.comments.create(body: "We are all comments!")

    visit company_job_path(company, job)
    save_and_open_page

    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_1.created_at)
    expect(page).to have_content(comment_1.updated_at)
    expect(page).to have_content(comment_2.body)
    expect(page).to have_content(comment_2.created_at)
    expect(page).to have_content(comment_2.updated_at)
    expect(page).to have_content(comment_3.body)
    expect(page).to have_content(comment_3.created_at)
    expect(page).to have_content(comment_3.updated_at)
  end
end
