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
	
end
