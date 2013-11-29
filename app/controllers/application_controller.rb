class ApplicationController < ActionController::Base
  protect_from_forgery
  if self.class=="RegistrationsController" then skip_authorization_check end#this lines cancel cancan authorization on devise controller 
  
  # the following method is used for redirecting after a devise sign in or sign up
  #the method overrides the devise default method which redirects to root url
  def after_sign_in_path_for(resource)
    #resource refers to user being signed in
    if resource.role == "company" then #if the user is company user
      #if it is first time after sign up go to new page of company else go to show page
      if resource.company.nil? then 
        new_user_company_path(resource)
        
      else
         ([resource,resource.company])
        
      end
    elsif resource.role== "applicant" then # if user is applicant user
     #if it is first time after sign up go to new page of company else go to show page
      if resource.applicant.nil? then
        new_user_applicant_path(resource)
        else
        ([resource,resource.applicant])
        end 
     else#if admin go to admin show path
      user_admin_path(resource,resource.admin)
    end
  end
  # this is layout chooser helper method for actions associated with multiple users
  #it chooses current layout according to current user
  def layout_chooser(current_user)
   unless current_user.nil?
    if current_user.role=="applicant" then
      @applicant=current_user.applicant
      layout="applicants"
    elsif current_user.role=="company" then
      @company=current_user.company
      layout="companies"
    else
      layout="admin"      
    end
    
   else
    layout="welcome"
   end
   layout
  end
 # this method specifically create a guest user if there is no user
 # it is applied to job post and company controllers' show pages using an append_before_filter
  def check_for_guest
    if(params[:user_id]) then 
      @user=User.find(params[:user_id])
    else
      @user=nil
    end
    @user
  end
end
