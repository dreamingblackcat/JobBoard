class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :job_post_title
      t.string :job_post_gender
      t.text :job_post_description
      t.date :job_post_start_date
      t.date :job_post_end_date
      t.integer :job_post_basic_salary
      t.text :job_post_requirement
      t.integer :company_id
      t.integer :category_id
      t.integer :location_id

      t.timestamps
    end
  end
end
