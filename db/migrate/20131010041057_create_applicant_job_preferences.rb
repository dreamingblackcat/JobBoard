class CreateApplicantJobPreferences < ActiveRecord::Migration
  def change
    create_table :applicant_job_preferences do |t|
      t.string :prefer_job_time
      t.date :prefer_start_available
      t.string :prefer_expected_salary
      t.integer :applicant_id
      t.integer :location_id

      t.timestamps
    end
  end
end
