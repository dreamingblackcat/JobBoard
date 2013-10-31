class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :applicant_id
      t.date :published_at

      t.timestamps
    end
  end
end
