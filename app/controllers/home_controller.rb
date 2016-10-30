class HomeController < ApplicationController
  def index
    @snippets = Snippet.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def home
    redirect_to snippets_path if logged_in?
  end
end
