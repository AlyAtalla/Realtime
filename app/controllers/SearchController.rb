class SearchController < ApplicationController
  def index
    if params[:query].present?
      @search_results = Article.where("title LIKE ?", "%#{params[:query]}%")
    else
      @search_results = Article.all
    end
  end
 end
 