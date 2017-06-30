class User < ApplicationRecord
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50 }
	validates :username, presence: true, length: { maximum: 50 },
							uniqueness: true
	
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
							format: { with: VALID_EMAIL_REGEX },
							uniqueness: {case_sensitive: false}

	has_secure_password
	VALID_PASSWORD_REGEX = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,20}\z/
	validates :password, presence: true, 	
	 						length: { minimum: 8 },
							format: { with: VALID_PASSWORD_REGEX }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.search(term)
    User.where('name LIKE ? OR username LIKE ?', "%#{term}%", "%#{term}%")
  end

end
