class WelcomeController < ApplicationController
	before_action :authenticate_user! , except: :index
	include WelcomeHelper
  def index
  end
  def search
    @search = PgSearch.multisearch(params[:search])
  end
end
