class SearchController < ApplicationController
  def index
    @search_query = params[:query]

    if @search_query.present?
      Search.record_search(@search_query, request.remote_ip)

      @recent_searches = Search.recent_searches
    else
      flash.now[:alert] = 'Please enter a search query.'
    end
  end
end
