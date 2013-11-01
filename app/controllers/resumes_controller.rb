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
        output=ResumePDF.new.to_pdf(@resume)
        send_data output, :filename=> "hello.pdf", :type=> "application/pdf", :disposition=>"inline"
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
  
  class ResumePDF < Prawn::Document
    def to_pdf(resume)
      @applicant=resume.applicant
      #@education_histories=resume.applicant.applicant_education_histories
      text resume.applicant.applicant_name,:align=>:center,:size=>30
      move_down 25
      font_size 20
      text "<color rgb='FF0000'><u>Personal Information</u></color>",:inline_format=>true
      move_down 30
      bounding_box([0,cursor],:width=>400,:height=>600) do
        image "#{@applicant.photo.path(:thumb)}",:fit=>[100,100],:position=>:center
        define_grid(:columns => 2, :rows => 11, :gutter => 10)
          
          grid(0,0).bounding_box do
              
          end
          grid(1,0).bounding_box do
              text "Nrc No:"
          end
          grid(1,1).bounding_box do
              text @applicant.applicant_nrc
          end
          grid(2,0).bounding_box do
              text "Contact Email:"
          end
          grid(2,1).bounding_box do
              text @applicant.applicant_contact_email
          end
          grid(3,0).bounding_box do
              text "Gender:"
          end
          grid(3,1).bounding_box do
              text @applicant.applicant_gender
          end
          grid(4,0).bounding_box do
              text "Marital Status:"
          end
          grid(4,1).bounding_box do
              text @applicant.applicant_marital_status
          end
          grid(5,0).bounding_box do
              text "Date of Birth:"
          end
          grid(5,1).bounding_box do
              text @applicant.applicant_dob.to_s
          end
          grid(6,0).bounding_box do
              text "Address:"
          end
          grid(6,1).bounding_box do
              text @applicant.applicant_address
          end
          grid(7,0).bounding_box do
              text "Phone Number:"
          end
          grid(7,1).bounding_box do
              text @applicant.applicant_phone_number
          end
          grid(8,0).bounding_box do
              text "Proficient Languages:"
          end
          grid(8,1).bounding_box do
              text @applicant.applicant_language
          end
          grid(9,0).bounding_box do
              text "Custom Skills and Expereinces:"
          end
          grid(9,1).bounding_box do
              text @applicant.applicant_skills
          end
          grid(10,0).bounding_box do
              text "Brief Description:"
          end
          grid(10,1).bounding_box do
              text @applicant.applicant_description
          end          
      end
      #Education Histries

      text "<color rgb='FF0000'><u>Education</u></color>",:inline_format=>true
      if @applicant.applicant_education_histories.count===0 then
        text "Information not supplied"
      else
      aeh_table_data=[["<font size='18'><b>Course of Study</b></font>","<font size='18'><b>Diploma,Degree or Certificate Name</b></font>","<font size='18'><b>University,    College or Institute</b></font>","<font size='18'><b>Location</b></font>"]]
       @applicant.applicant_education_histories.map do|aeh|
        aeh_table_data<<[aeh.course_of_study,aeh.diploma_degree_certificate,aeh.institute_name,aeh.location]
       end      
      table(aeh_table_data,:header=>true,:cell_style => { 
      :borders => [],
      :border_width => 3,
      :border_color => "FF0000",
      :background_color=>"FFFFCC",
      :size=>15,
      :overflow => :shrink_to_fit,
      :min_font_size=>16,
      :inline_format=>true
      },:header=>true)
      move_down 20
      end
      #Job Histries

      text "<color rgb='FF0000'><u>Job Histories</u></color>",:inline_format=>true
      if @applicant.applicant_job_histories.count===0 then
        text "Information not supplied"
      else
      ajh_table_data=[
          ["<font size='18'><b>Title</b></font>",
            "<font size='18'><b>Company</b></font>",
            "<font size='18'><b>Address</b></font>",
          "<font size='18'><b>Start Date</b></font>",
          "<font size='18'><b>End Date</b></font>",
          "<font size='18'><b>Reason</b></font>"]
        ]
       @applicant.applicant_job_histories.map do|ajh|
        ajh_table_data<<[ajh.job_title, ajh.company_name,ajh.address, ajh.start_date, ajh.end_date, ajh.reason]
       end      
      table(ajh_table_data,:header=>true,:cell_style => { 
      :borders => [],
      :border_width => 3,
      :border_color => "FF0000",
      :background_color=>"FFFFCC",
      :size=>15,
      :overflow => :shrink_to_fit,
      :min_font_size=>16,
      :inline_format=>true
      },:header=>true)
      end
     render
  
    end
    end
end
