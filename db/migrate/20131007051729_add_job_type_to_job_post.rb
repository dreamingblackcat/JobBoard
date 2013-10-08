class AddJobTypeToJobPost < ActiveRecord::Migration
  def change
    add_column :job_posts, :job_type, :string
  end
end
