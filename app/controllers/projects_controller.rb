class ProjectsController < ApplicationController
  before_action :set_project, :except => [:index, :new, :create, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.includes(:items).find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project),
                      :notice => 'Project was successfully created.' }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_path(@project),
                      :notice => 'Project was successfully updated.' }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path,
                    :notice => 'Project was successfully destroyed.' }
    end
  end

  def clear
    notice = if @project.items.complete.destroy_all.empty?
               'There are no completed items for this project.'
             else
               'Completed items were successfully cleared.'
             end
    respond_to do |format|
      format.html { redirect_to project_path(@project),
                    :notice => notice }
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

