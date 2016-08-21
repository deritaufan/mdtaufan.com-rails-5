class EditorsController < ApplicationController

	def index
	end
  
  def show
  	@editor = Editor.find(params[:id])
  end

  def new
  	@editor = Editor.new
  end

  def create
  	@editor = Editor.new(editor_params)
  	if @editor.save
  		flash[:success] = "#{@editor.name} created."
  		redirect_to editors_url
  	else
  		render 'new'
  	end
  end

  private

  	def editor_params
  		params.require(:editor).permit(:name, :email, :password, :password_confirmation)
  	end
end
