class SnippetsController < ApplicationController
  before_action :find_snippet, only: [:edit, :update, :destroy, :show]
  before_action :require_user, except: [:index, :show, :subindex]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    @snippet.user = current_user
    if @snippet.save
      # flash[:success] = 'Snippet Created!'
      redirect_to snippet_path(@snippet)
    else
      flash.now[:danger] = 'Please see the errors below'
      render :new
    end
  end

  def index
    # @snippets = Snippet.all
    @kinds = Kind.all
  end

  def show
  end

  def subindex
    kind = Kind.find params[:id]
    @snippets = kind.snippets.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      flash[:success] = 'Snippet updated!'
      redirect_to snippet_path(@snippet)
    else
      # flash.now[:danger] = 'See errors below'
      render :edit
    end
  end

  def destroy
    @snippet.destroy
    flash[:danger] = 'Snippet was deleted!'
    redirect_to snippets_path
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :work, :kind_id, :is_private?)
  end

  def find_snippet
    @snippet = Snippet.find(params[:id])
  end

  def require_same_user
    if current_user != @snippet.user
      flash[:danger] = "You can only edit or delete your own snippets"
      redirect_to root_path
    end
  end

end
