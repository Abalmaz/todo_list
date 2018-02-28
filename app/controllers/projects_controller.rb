class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
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
	    respond_to do |format|
	      if @project.update(project_params)
	        format.html { redirect_to root_path, notice: 'Todo list was successfully updated.' }
	        format.json { render :show, status: :ok, location: @project }
	      else
	        format.html { render :edit }
	        format.json { render json: @project.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
    	@project.destroy
    	respond_to do |format|
      	format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
     	format.json { head :no_content }
    end
  	end

	private

	def set_project
		@project = Project.find(params[:id])
	end

	 def project_params
      params.require(:project).permit(:title)
    end

end
