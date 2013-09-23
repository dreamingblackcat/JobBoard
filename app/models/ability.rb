class Ability
	include CanCan::Ability

	def initialize(user)
		user||=User.new
			if user.email== "dbc@gmail.com"
				can :manage, :all
			else	
				can :read,:all
			end
		else can :read,:all	
	end
	
	
end