require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @search_query' do
      get :index, params: { query: 'test query' }
      expect(assigns(:search_query)).to eq('test query')
    end

    context 'with a non-empty search query' do
      it 'records the search and assigns @recent_searches' do
        expect(Search).to receive(:record_search).with('test query', '127.0.0.1')
        get :index, params: { query: 'test query' }
        expect(assigns(:recent_searches)).to be_a(ActiveRecord::Relation)
      end
    end

    context 'with an empty search query' do
      it 'does not record the search and sets a flash alert' do
        expect(Search).not_to receive(:record_search)
        get :index, params: { query: '' }
        expect(flash[:alert]).to be_present
      end
    end
  end
end
