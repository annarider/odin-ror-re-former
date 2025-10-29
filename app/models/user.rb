class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 4, maximum: 20 },
                       format: { with: /\A[A-Za-z0-9_]+\z/,
                                message: "only allows letters, numbers, and underscores" }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, length: { minimum: 6, maximum: 30 }, if: :password_digest_changed?
end
