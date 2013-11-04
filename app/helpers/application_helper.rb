module ApplicationHelper
	  def active? hclass
	     hclass== @hero_class
	  end
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
	  def content_type_format(content_type)
	   # content_type.split("/").last.to_sym
	    format=""
	   Mime::EXTENSION_LOOKUP.each do|k,v|
	     format=k if v==content_type
	   end
	   format.to_sym
	  end
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
     
     def sidebar_chooser(current_user)
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
