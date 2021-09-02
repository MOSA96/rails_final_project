class User < ApplicationRecord
    before_save { email.downcase!}
    validates :name, presence: true, length: { maximum: 50 }
    #validates :email, presence: true, length: { maximum: 255 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    #Every time a new user is created give 10000 funds
    after_initialize do
        if self.new_record?
        self.funds = 10000
        self.ibm = 0
        self.amazon = 0
        self.apple = 0
        end
    end
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    
end

