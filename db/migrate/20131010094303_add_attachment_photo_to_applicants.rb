class AddAttachmentPhotoToApplicants < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :applicants, :photo
  end
end
