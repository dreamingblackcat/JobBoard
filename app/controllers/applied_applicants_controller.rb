class AppliedApplicantsController < ApplicationController
  layout "companies"
  def index
    @user=current_user
    @company=@user.company
    @applicant=@user.applicant
    @job_posts=@company.job_posts
  end
end
