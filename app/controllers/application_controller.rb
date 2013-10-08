class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    
    if resource.role == "company"then
      
      if resource.company.nil? then
        new_user_company_path(resource)
        
      else
         ([resource,resource.company])
        
      end
    else
      root_url
    end
  end
 
end
