require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    context 'with a valid search query' do
      it 'records the search and retrieves recent searches' do
        search_query = 'example'
        allow(Search).to receive(:record_search)
        allow(Search).to receive(:recent_searches)

        get :index, params: { query: search_query }

        expect(response).to have_http_status(:success)
        expect(assigns(:search_query)).to eq(search_query)
        expect(Search).to have_received(:record_search).with(search_query, anything)
        expect(Search).to have_received(:recent_searches)
      end
    end

    context 'with an empty search query' do
      it 'sets a flash alert' do
        get :index, params: { query: '' }

        expect(response).to have_http_status(:success)
        expect(flash[:alert]).to be_present
      end
    end
  end
end