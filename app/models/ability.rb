class Ability
	include CanCan::Ability

	def initialize(user)
		user||=User.new
			if user.email== "dbc@gmail.com"
				can :manage, :all
			end
		if user.role=="applicant" then
		  can :manage,User,:id=>user.id
		  can [:new,:create],Applicant if user.applicant.nil?
			can [:show,:update,:edit,:destroy],Applicant.where(:user_id=> user.id)
			can [:index,:show,:edit,:new,:destroy,:create,:update],ApplicantJobHistory,:applicant=>{:user_id=>user.id}
			can [:index,:show,:edit,:new,:destroy,:create,:update],ApplicantJobPreference,:applicant=>{:user_id=>user.id} 
			can [:index,:show,:edit,:new,:destroy,:create,:update],ApplicantEducationHistory,:applicant=>{:user_id=>user.id}
			can [:show],JobPost
			can [:index,:show,:edit,:new,:destroy,:create,:update],Resume,:applicant=>{:user_id=>user.id}
			
		elsif user.role=="company"then
		  can :manage,User,:id=>user.id
		  can [:new,:create],Company if user.company.nil?
		  can [:show,:new,:create,:update,:edit,:destroy],Company.where(:user_id=> user.id)
		  can [:index,:show,:new,:create,:update,:edit],JobPost,:company=>{:user_id=>user.id}
		  can [:read],Applicant
		  can [:show,:index],Resume
		else
		  can :manage,User
		  can [:show],Admin
		  can [:manage],Category
		  can [:manage],Location
		  can [:index],Applicant
		  can [:index,:destroy,:show],Company
		  can [:index,:destroy,:show],JobPost	
		end
	end
end