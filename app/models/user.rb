class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "Rentrez une adresse email valide de moins de 255 caractères."}, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password validations: false
  validates :password, presence: true
                       confirmation: true,
                       length: { within: 6..40, message: "Rentrez un mot de passe entre 6 et 40 caractères" }
end
