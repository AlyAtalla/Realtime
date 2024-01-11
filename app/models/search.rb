class Search < ApplicationRecord
  validates :query, presence: true

  def self.record_search(query, user_ip)
    return if query.blank?

    create(query:, user_ip:)
  end
end
