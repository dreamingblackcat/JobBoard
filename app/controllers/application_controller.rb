class ApplicationController < ActionController::Base
  protect_from_forgery
  if self.class=="RegistrationsController" then skip_authorization_check end
  def after_sign_in_path_for(resource)
    
    if resource.role == "company" then
      
      if resource.company.nil? then
        new_user_company_path(resource)
        
      else
         ([resource,resource.company])
        
      end
    elsif resource.role== "applicant" then
      
      if resource.applicant.nil? then
        new_user_applicant_path(resource)
        else
        ([resource,resource.applicant])
        end 
     else
      root_url
    end
  end
 
end
