class AddAttachmentCertificateToApplicantEducationHistories < ActiveRecord::Migration
  def self.up
    change_table :applicant_education_histories do |t|
      t.attachment :certificate
    end
  end

  def self.down
    #
  end
end
