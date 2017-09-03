require 'rails_helper'

RSpec.feature "User sees comments" do
  scenario "user visits job and sees all comments associated with that job" do
    job = create(:job)
    company = job.company
    comment_1 = job.comments.create(body: "I am a comment!")
    comment_2 = job.comments.create(body: "You are a comment!")
    comment_3 = job.comments.create(body: "We are all comments!")

    visit company_job_path(company, job)

    comments = Comment.all

    comments.each do |comment|
      expect(page).to have_content(comment.body)
      expect(page).to have_content(comment.created_at)
      expect(page).to have_content(comment.updated_at)
    end

    expect(comment_3.body).to appear_before(comment_2.body)
    expect(comment_2.body).to appear_before(comment_1.body)
  end
end
