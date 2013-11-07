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
      user_admin_path(resource,resource.admin)
    end
  end
  # this is layout chooser helper method for actions associated with multiple users
  def layout_chooser(current_user)
    if current_user.role=="applicant" then
      @applicant=current_user.applicant
      layout="applicants"
    elsif current_user.role=="company" then
      @company=current_user.company
      layout="companies"
    else
      layout="admin"      
    end
    layout
  end
 
end
