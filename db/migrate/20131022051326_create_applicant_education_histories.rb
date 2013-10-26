class CreateApplicantEducationHistories < ActiveRecord::Migration
  def change
    create_table :applicant_education_histories do |t|
      t.string :institute_name
      t.string :location
      t.string :diploma_degree_certificate
      t.text :course_of_study
      t.integer :applicant_id

      t.timestamps
    end
  end
end
