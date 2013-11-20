class JobPostSearchController < ApplicationController
  def index
    layout=layout_chooser(current_user)
    if(params[:category].nil?)
      @job_posts=JobPost.active.paginate(:page=>params[:page],:per_page=>2)
    else
      @job_posts=Category.find_by_name(params[:category]).job_posts.active.paginate(:page=>params[:page],:per_page=>2)
    end
  end
end
