class Backoffice::SendMailController < ApplicationController
	def edit
		@admin = Admin.find(params[:id])
		respond_to_js
	end

	def create
		begin
			AdminMailer.send_email(current_admin, 
													   params[:'recipient-name'], params[:'subject-text'], params[:'message-text'])
														 .deliver_now
			notify_mail_msg("E-mail foi enviado com sucesso!", "success")
		rescue
			notify_mail_msg("Algum erro ocorreu. E-mail não foi enviado!", "error")
		end

		respond_to_js
	end



	private

	def respond_to_js
		respond_to do |format|
			format.js
		end
	end

	def notify_mail_msg(notify_message, notify_type)
		@notify_message = notify_message
		@notify_type = notify_type
	end

end
