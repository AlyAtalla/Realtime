RSpec.describe Article, type: :model do
  describe 'searchkick configuration' do
    it 'configures searchkick with the correct options' do
      expect(Article).to respond_to(:searchkick)
      expect(Article.searchkick_options).to include(text_middle: %i[title content])
    end
  end
end