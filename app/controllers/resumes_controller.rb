class ResumesController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :applicant,:through=>:user,:singleton=>true
  load_and_authorize_resource :resume,:through=>:applicant,:singleton=>true
  layout "applicants"
  
  def index
    @resumes.paginate(params[:page],:per_page=>2)
  end

  def show
    respond_to do|format|
      format.html
      format.pdf do
        render :text=>"Hello World!"
      end
    end
  end
  
  def new
    
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end

  def create
    @resume.published_at=Date.today
    respond_to do |format|
        if @resume.save
          format.html { redirect_to [@applicant.user,@applicant,@resume], notice: 'Your Resume was successfully created.' }
          format.json { render json: @resume, status: :created, location: @resume }
        else
          format.html { render action: "new" }
          format.json { render json: @resume.errors, status: :unprocessable_entity }
        end
    end
  end
end
