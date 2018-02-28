class TasksController < ApplicationController

	before_action :set_project
	before_action :set_task, except: [:create]

	def create
		@task = @project.tasks.create(task_params)
		redirect_to root_path
		@task.save
	end

	def destroy
		if @task.destroy
			flash[:success] = "Task was deleted."
		else 
			flash[:error] = "Task couldn't be deleted. Some thing wrong."
		end

		redirect_to root_path
	end

	def edit
    end

    def update
	    if @task.update_attributes!(task_params)
	    	redirect_to root_path
		end
	end

	private

	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_task
		@task = @project.tasks.find(params[:id])
	end

	def task_params
		params[:task].permit(:content)
	end

end
