class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @projects = Project.all
    else
      @projects = Project.where("publish = ?", true)
    end
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @project.update!(project_params)
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path
    else
      render :show, status: :see_other
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :category, :content_problematic, :content_solution, :publish)
  end
end
