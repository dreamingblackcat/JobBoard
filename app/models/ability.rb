class Ability
	include CanCan::Ability

	def initialize(user)
		user||=User.new
			if user.email== "dbc@gmail.com"
				can :manage, :all
			end
		if user.role=="applicant" then
		  can :manage,User,:id=>user.id
			can [:show,:new,:create,:update,:edit,:destroy],Applicant.where(:user_id=> user.id)
			can [:show,:edit,:new,:destroy,:create,:update],ApplicantJobHistory,:applicant=>{:user_id=>user.id}
			can [:show,:edit,:new,:destroy,:create,:update],ApplicantJobPreference,:applicant=>{:user_id=>user.id}  
			
		end
	end
end