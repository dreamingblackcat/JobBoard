class CreateApplicantJobPost < ActiveRecord::Migration
  def change
    create_table :applicant_job_posts do |t|
      t.integer :applicant_id
      t.integer :job_post_id
      t.date :applied_at
    end
  end
end
