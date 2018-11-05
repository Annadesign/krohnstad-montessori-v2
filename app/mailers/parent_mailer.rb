class ParentMailer < ApplicationMailer
	default :from => 'Krohnstad Montessori <enetta@krohnstad.no>'
	def password_reset(parent)
	  @parent = parent
	  mail :to => parent.email, :subject => "Gjenopprette passord"
	end
	
end
