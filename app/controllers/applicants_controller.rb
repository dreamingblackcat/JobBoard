class ApplicantsController < ApplicationController
    load_and_authorize_resource :user
    load_and_authorize_resource :applicant,:through=>:user,:singleton=>true,:except=>[:index]
  
	def index
    
      layout=layout_chooser(@user)
      @applicants=Applicant.paginate(:page=>params[:page],:per_page=>2)
    respond_to do |format|
      format.html do
        render :action=>"index",:layout=>layout
      end
      format.json { render json: @applicants }
    end
  end

  	def new
		# @applicant = Applicant.new(:user_id=>params[:user_id])

		respond_to do |format|
			format.html
			format.json{render json: @applicant}
		end
	end

	def create
    
    # @applicant=Applicant.new(params[:applicant])

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to [@applicant.user,@applicant], notice: 'Applicant was successfully created.' }
        format.json { render json: @applicant, status: :created, location: @applicant }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

	def show
		#@applicant = Applicant.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant }
  		end
	end

	def edit
    # @applicant = Applicant.find(params[:id])
 	end

 	def update
    # @applicant = Applicant.find(params[:id])

    respond_to do |format|
      if @applicant.update_attributes(params[:applicant])
        format.html { redirect_to [@applicant.user,@applicant], notice: 'applicant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

end
