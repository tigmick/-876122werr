class WelcomeController < ApplicationController
	include WelcomeHelper
  def index
  end
  def search
    # @search = PgSearch.multisearch(params[:search])
    if params[:search].present? || params[:category].present?
    @search = Job.where("title LIKE ?", "%#{params[:search]}%") unless params[:category].present?
    @search = Job.where("title LIKE ? AND industry_id = ?", "%#{params[:search]}%","#{params[:category]}") if params[:category].present?
    @search = Job.where("industry_id = ?","#{params[:category]}") unless params[:search].present?
    @search = @search.paginate(:page => params[:page], :per_page => 6).order(created_at: :desc)
    else
    	@search = Job.all.paginate(:page => params[:page], :per_page => 6).order(created_at: :desc)
    end
  end

  def search_candidate
   user_ids =  UserJob.all.select{|j| (j.job_ids & current_user.jobs.map(&:id)).any?}.map(&:user_id).uniq
   @users =  User.where(id: user_ids).where("first_name LIKE ? AND role = ?","#{params[:search_candidate]}%", "candidate")
  end
end
