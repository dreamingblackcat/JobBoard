class RemoveApplicantUrlFromApplicants < ActiveRecord::Migration
  def self.up
    remove_column :applicants, :applicant_url
  end
  def self.down
    add_column :applicants,:applicant_url,:string
  end
end
