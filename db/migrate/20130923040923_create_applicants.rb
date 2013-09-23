class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :app_name
      t.string :app_nrc
      t.string :app_url
      t.string :app_contact_email
      t.string :app_gender
      t.boolean :app_marital_status
      t.date :app_dob
      t.text :app_address
      t.string :app_phone_number
      t.text :app_language
      t.text :app_skills
      t.text :app_description
      t.integer :user_id

      t.timestamps
    end
  end
end
