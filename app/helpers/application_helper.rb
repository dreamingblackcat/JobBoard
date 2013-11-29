module ApplicationHelper

	  #these are helpers overriding devise built in ones
	  #they are required to display log in form in the view of other controller(eg. heros controller in this case)
	  def resource_name
	    :user
	  end

	  def resource
	    @resource ||= User.new
	  end

	  def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	  end
	  
	  #this is helper method for pdf downloading
	  #eg.
	  #if given content type is applicantion/pdf the method will return :pdf as a symbol
	  #if given content type is image/jpeg, the method will return :jpeg as a symbol
	  def content_type_format(content_type)
	   # content_type.split("/").last.to_sym
	    format=""
	   Mime::EXTENSION_LOOKUP.each do|k,v|
	     format=k if v==content_type
	   end
	   format.to_sym
	  end
	  
	  #this helper method is used for job application of applicant
	  # for every job post that an applicant view, it will generate a link if the job is not already applied.
	  #if the job is already applied, the method generate a message div to tell the applicant that the job is already applied
  	def apply_job_link(applicant,job_post)
      
      already=false
      applicant.job_posts.each do |jp|
        if jp==job_post then 
          already=true
        end
      end
      unless already then
        link_to 'Apply Job', user_applicant_apply_jobs_path({:user_id=>@applicant.user,:applicant_id=>@applicant,:job_post_id=>job_post.id}),:method=>:post
      else
        " <div class='text-warning'>Applied</div> ".html_safe
      end
     end
     #this helper method is used for most view pages to choose a sidebar according to current user
     def sidebar_chooser(current_user)
       unless current_user.nil?
        case current_user.role
            when "company" 
              render :partial=>"layouts/company_sidebars"
            when "admin"
             render :partial=>"layouts/admin_sidebars"
            else
              render :partial=>"layouts/applicant_sidebars"
         end
         end
     end
     #this is the view helper for generating company show path based on user or guest
     def show_path_for_company(current_user,company)
      if current_user.nil? then
        link_to "#{company.com_name}", company_path(company) 
      else
        link_to "#{company.com_name}", [current_user,company] 
      end
    end
    #this is the view helper for generating company show path based on user or guest
    def show_path_for_job_post(current_user,job_post)
      if current_user.nil? then
        link_to "#{job_post.job_post_title}", job_post_path(job_post) 
      else
        link_to "#{job_post.job_post_title}", [current_user,job_post.company,job_post] 
      end
    end
    #this is the view helper for choosing home page to appropriately link to each user home page
    def home_chooser(current_user)
      if(current_user.nil?) then
        link_to "Home",root_url
      else
         if(current_user.role=="admin") then
          link_to "Home",user_admin_path(:user_id=>current_user.id,:id=>current_user.admin.id)
         elsif(current_user.role=="company") then
           if(current_user.company.nil?) then
            link_to "Home",new_user_company_path(:user_id=>current_user.id)
           else
            link_to "Home",user_company_path(:user_id=>current_user.id,:id=>current_user.company.id)
           end
         else
           if(current_user.applicant.nil?)then
            link_to "Home",new_user_applicant_path(:user_id=>current_user.id) 
           else
            link_to "Home",user_applicant_path(:user_id=>current_user.id,:id=>current_user.applicant.id) 
           end
         end
       end
    end
   
end
