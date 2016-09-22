class SessionsController < ApplicationController
  def new
  end

  def create
  	editor = Editor.find_by(email: params[:session][:email].downcase)
  	if editor && editor.authenticate(params[:session][:password])
  		log_in editor
  		redirect_to dashboard_url
  	else
  		flash.now[:danger] = 'Invalid email or password combination'
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
