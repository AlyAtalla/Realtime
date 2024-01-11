class SearchController < ApplicationController
  def index
    @search_results = if params[:query].present?
                        Article.where('title LIKE ?', "%#{params[:query]}%")
                      else
                        Article.all
                      end
  end
end
