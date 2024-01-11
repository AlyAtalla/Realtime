class Search < ApplicationRecord
  validates :query, presence: true

  def self.record_search(query, user_ip)
    return if query.blank?

    create(query: query, user_ip: user_ip)
  end
end
