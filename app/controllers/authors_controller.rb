class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :edit, :destroy]
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
