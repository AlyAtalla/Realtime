require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:query) }
  end

  describe 'record_search' do
    it 'creates a new search record' do
      expect do
        Search.record_search('test query', '127.0.0.1')
      end.to change(Search, :count).by(1)
    end

    it 'does not create a new search record for blank query' do
      expect do
        Search.record_search('', '127.0.0.1')
      end.not_to change(Search, :count)
    end
  end
end
