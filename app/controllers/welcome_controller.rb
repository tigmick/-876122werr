class WelcomeController < ApplicationController
	include WelcomeHelper
  def index
  end
  def search
    @search = PgSearch.multisearch(params[:search])
  end
end
