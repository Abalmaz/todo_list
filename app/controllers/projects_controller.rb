class ProjectsController < ApplicationController

	before_action :authenticate_user!

	before_action :set_project, only: [:edit, :update, :destroy]

	def index
		@projects = current_user.projects
	end

	def edit
    end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)
		if @project.save
			redirect_to root_path
		else 
			render 'new'
		end
	end
	
	def update
	    if @project.update(project_params)
	    	redirect_to root_path
		else 
			render 'edit'
		end
	end

	def destroy
    	@project.destroy
    	redirect_to root_path
  	end

	private

	def set_project
		@project = Project.find(params[:id])
	end

	 def project_params
      params.require(:project).permit(:title)
    end

end
