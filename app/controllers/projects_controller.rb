class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]


  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to @project
    end
  end

  # GET /projects
  # GET /projects.json
  def index
 
    @userId = current_user.id
    @projects = Project.where("OwnerUserId = " + @userId.to_s + " And Enable = 0")
  
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    redirect_to(:action => :index)
    #redirect_to :root
    #redirect_to @project
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create

    @project = Project.new(project_params)
    
    @project.OwnerUserId = current_user.id
    @project.Enable = "True"

    respond_to do |format|
      if @project.save
        #format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.html { redirect_to @project, notice: 'Experiment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Experiment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@project.destroy
    #respond_to do |format|
    #  format.html { redirect_to :root }
    #  format.json { head :no_content }
    #end
    respond_to do |format|

      # Em vez de excluir registro somente Desabilita Project, Campo Enable=False
      if @project.update_attribute(:Enable, 1)
        format.html { redirect_to @project }
        format.json { head :no_content }
      else
        format.html { redirect_to @project }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :details, :OwnerUserId, :Enable)
    end
    
end
