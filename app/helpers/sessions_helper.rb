module SessionsHelper

	def log_in(editor)
		session[:user_id] = editor.id
	end

	def current_editor
		@current_editor ||= Editor.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_editor.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_editor = nil
	end
	
end
