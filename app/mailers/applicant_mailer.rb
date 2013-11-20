class ApplicantMailer < ActionMailer::Base
  default from: "asdf@asdf.com"
  
  def notification_mail(company)
    mail(:to=>"#{company.com_name}<#{company.com_email}>",:subject=>"Applying Job")
  end
end
