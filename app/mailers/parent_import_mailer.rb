class ParentImportMailer < ApplicationMailer
	 default :from => 'Krohnstad Montessori <enetta@krohnstad.no>'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_import_email(parentname, parentemail, parentpassword)
    @parentname = parentname
    @parentemail = parentemail
    @parentpassword = parentpassword
    attachments.inline["logo-email.png"] = File.read("#{Rails.root}/app/assets/images/logo-email.png")
    mail( :to => @parentemail,
    :subject => 'Innlogging til nye kronhstad.no' )
  end	
end
