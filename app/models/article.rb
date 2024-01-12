class Article < ApplicationRecord
  searchkick text_middle: %i[title content]
end
