require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.create(name: "Turing")
        category = Category.create(title: "Software")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe ".count_of_job_by_loi" do
    it "returns count of jobs by level of interest" do
      create_list(:job, 10)
      expect(Job.count_of_job_by_loi.keys.first).to eq(10)
      expect(Job.count_of_job_by_loi.values.first).to eq(1)
    end
  end

  describe ".level_of_interest_by_company" do
    it "returns top three companies ranked by average level of interest" do
      company_1 = Company.create(name: "Spotify")
      company_2 = Company.create(name: "Pandora")
      company_3 = Company.create(name: "Soundcloud")
      company_4 = Company.create(name: "Youtube")

      JOBS = ["Engineering", "Development"]
      CITIES = ["Seattle", "Denver"]
      CATEGORIES = ["Accounting", "Engineering"]

      category = Category.find_or_create_by(title: CATEGORIES.sample)

      JOBS.each do |job|
        company_1.jobs.create(title: job, description: "What a great position!", level_of_interest: 40, city: CITIES.sample, category: category)
      end

      JOBS.each do |job|
        company_2.jobs.create(title: job, description: "What a great position!", level_of_interest: 30, city: CITIES.sample, category: category)
      end

      JOBS.each do |job|
        company_3.jobs.create(title: job, description: "What a great position!", level_of_interest: 20, city: CITIES.sample, category: category)
      end

      JOBS.each do |job|
        company_4.jobs.create(title: job, description: "What a great position!", level_of_interest: 10, city: CITIES.sample, category: category)
      end

      expect(Job.level_of_interest_by_company.count).to eq(3)
      expect(Job.level_of_interest_by_company.first[1]).to eq(40)
      expect(Job.level_of_interest_by_company.last[1]).to eq(20)
    end
  end

  describe ".count_by_city" do
    it "returns the count of jobs by city" do
      cities = ["Seattle", "Portland", "Denver"]

      company = Company.create(name: "Microsoft")
      category = Category.create(title: "Engineer")
      job = "Ruby Engineer"

      cities.each do |city|
        company.jobs.create(title: job, description: "What a great position!", level_of_interest: 30, city: city, category: category)
      end

      expect(Job.count_by_city.keys.first).to eq("Denver")
      expect(Job.count_by_city.values.first).to eq(1)
    end
  end
end
