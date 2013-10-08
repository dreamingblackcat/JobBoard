module CompaniesHelper
    def add_company_right_bar
       content_for :right_bar do
       unless @company.nil? then link_to 'Post a new Job', new_user_company_job_post_path({:user_id=>@company.user.id,:company_id=>@company.id}),:class=>'btn btn-warning' end
          
       end
  end
end
