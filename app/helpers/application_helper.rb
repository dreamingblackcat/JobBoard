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
	
end
