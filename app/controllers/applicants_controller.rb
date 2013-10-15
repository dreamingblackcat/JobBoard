class ApplicantsController < ApplicationController
	def index
    # @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicants }
    end
  end

  	def new
		@applicant = Applicant.new(:user_id=>params[:user_id])

		respond_to do |format|
			format.html
			format.json{render json: @applicant}
		end
	end

	def create
    #@user=User.find(params[:user_id])
    @applicant=Applicant.new(params[:applicant])
    #@company.user_id=@user.id
   # redirect_to [@company.user,@company]
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
		@applicant = Applicant.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant }
  		end
	end

	def edit
    @applicant = Applicant.find(params[:id])
 	end

 	def update
    @applicant = Applicant.find(params[:id])

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
