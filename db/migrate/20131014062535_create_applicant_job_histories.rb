class CreateApplicantJobHistories < ActiveRecord::Migration
  def change
    create_table :applicant_job_histories do |t|
      t.string :company_name
      t.string :job_title
      t.text :address
      t.date :start_date
      t.date :end_date
      t.text :reason
      t.integer :applicant_id

      t.timestamps
    end
  end
end
