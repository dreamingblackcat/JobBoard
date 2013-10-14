class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :applicant_name
      t.string :applicant_nrc
      t.string :applicant_url
      t.string :applicant_contact_email
      t.string :applicant_gender
      t.string :applicant_marital_status
      t.date :applicant_dob
      t.string :applicant_address
      t.string :applicant_phone_number
      t.string :applicant_language
      t.text :applicant_skills
      t.text :applicant_description
      t.integer :user_id

      t.timestamps
    end
  end
end
