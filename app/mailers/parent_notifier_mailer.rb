class ParentNotifierMailer < ApplicationMailer
	 default :from => 'Krohnstad Montessori <enetta@krohnstad.no>'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(parent)
    @parent = parent
    attachments.inline["logo-email.png"] = File.read("#{Rails.root}/app/assets/images/logo-email.png")
    mail( :to => @parent.email,
    :subject => 'Registrering til din side' )
  end
end
