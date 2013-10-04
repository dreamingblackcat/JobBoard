class Ability
	include CanCan::Ability

	def initialize(user)
		user||=User.new
			if user.email== "dbc@gmail.com"
				can :manage, :all
			end
		if user.role=="applicant" then
			can :manage,:all
			
		end
	end
end