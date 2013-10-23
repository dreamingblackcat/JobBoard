class ApplicantJobPreferencesController < ApplicationController
  # GET /applicant_job_preferences
  # GET /applicant_job_preferences.json
  load_and_authorize_resource :user,:except=>[:show,:destroy]
  load_and_authorize_resource :applicant,:through=>:user,:singleton=>true,:except=>[:show,:destroy]
  load_and_authorize_resource :applicant_job_preference,:through=>:applicant,:except=>[:show,:destroy]
  layout "applicants"
  def index
    # @applicant_job_preferences = ApplicantJobPreference.all
      @applicant_job_preferences=@applicant_job_preferences.paginate(:page=>params[:page],:per_page=>2)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicant_job_preferences }
    end
  end

  # GET /applicant_job_preferences/1
  # GET /applicant_job_preferences/1.json
  def show
    @user=User.find(params[:user_id])
     @applicant = Applicant.find(params[:applicant_id])
     @applicant_job_preference = @applicant.applicant_job_preferences.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant_job_preference }
    end
  end

  # GET /applicant_job_preferences/new
  # GET /applicant_job_preferences/new.json
  def new
    # @applicant = Applicant.find(params[:applicant_id])
    # @applicant_job_preference = @applicant.applicant_job_preferences.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applicant_job_preference }
    end
  end

  # GET /applicant_job_preferences/1/edit
  def edit
    # @applicant = Applicant.find(params[:applicant_id])
    # @applicant_job_preference = @applicant.applicant_job_preferences.find(params[:id])
  end

  # POST /applicant_job_preferences
  # POST /applicant_job_preferences.json
  def create
    # @applicant = Applicant.find(params[:applicant_id])   
    # @applicant_job_preference = @applicant.applicant_job_preferences.create(params[:applicant_job_preference])

    respond_to do |format|
      if @applicant_job_preference.save
        format.html { redirect_to [@applicant.user,@applicant,@applicant_job_preference], notice: 'Applicant job preference was successfully created.' }
        format.json { render json: @applicant_job_preference, status: :created, location: @applicant_job_preference }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant_job_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applicant_job_preferences/1
  # PUT /applicant_job_preferences/1.json
  def update
    # @applicant = Applicant.find(params[:applicant_id])   
    # @applicant_job_preference = @applicant.applicant_job_preferences.find(params[:id])

    respond_to do |format|
      if @applicant_job_preference.update_attributes(params[:applicant_job_preference])
        format.html { redirect_to [@applicant_job_preference.applicant.user,@applicant_job_preference.applicant, @applicant_job_preference], notice: 'Applicant job preference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant_job_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_job_preferences/1
  # DELETE /applicant_job_preferences/1.json
  def destroy
    @applicant_job_preference = ApplicantJobPreference.find(params[:id])
    @applicant_job_preference.destroy

    respond_to do |format|
      format.html { redirect_to user_applicant_applicant_job_preferences_path(@applicant_job_preference.applicant.user,@applicant_job_preference.applicant) }
      format.json { head :no_content }
    end
  end
end
