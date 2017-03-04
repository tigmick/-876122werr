class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /Jobs
  # GET /Jobs.json
  def index
    @jobs = Job.all
    if current_user.client? 
      @jobs =  current_user.jobs
    end
  end

  # GET /Jobs/1
  # GET /Jobs/1.json
  def show
    @users = UserJob.all.collect{|k| k.job_ids.include?(@job.id) ? User.find(k.user_id) : []}.flatten
    @interview = Interview.new
  end

  # GET /Jobs/new
  def new
    @job = Job.new
  end

  # GET /Jobs/1/edit
  def edit
    
  end

  # POST /Jobs
  # POST /Jobs.json
  def create
    @job = current_user.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Jobs/1
  # PATCH/PUT /Jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Jobs/1
  # DELETE /Jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description,:industry_id)
    end
end
