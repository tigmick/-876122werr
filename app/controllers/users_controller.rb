class UsersController < ApplicationController
  include UsersHelper
	before_action :check_reviews, only: :user_profile  
  def dashboard
    if current_user.client?
      @user = current_user
      @jobs = current_user.jobs

    else
      @user = current_user
      @applied_jobs = current_user.user_job.present? ? Job.where(id: current_user.user_job.job_ids) : [] 
      @reviews = Review.joins(:job).where(user_id: current_user.id).select("id","job_id","jobs.user_id","created_at","cv_download_date")
    end
  end

  def user_profile
  	@user =  User.find(params[:id])
  	@job = Job.find(params[:job_id])
  end

  def check_reviews
  	if params[:review].present?
  		review = Review.find_or_create_by(job_id: params[:job_id], user_id: params[:id])
      is_review = review.is_review 
      review.update(is_review: true, review_count: (review.review_count.to_i+1))
 	    # UserMailer.review_mail(params[:id], params[:job_id]).deliver_now if is_review
    end
  end
end
