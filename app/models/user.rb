class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :password, presence: true, length: { minimum: 6 }

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
