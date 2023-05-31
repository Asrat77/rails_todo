class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true

    def name_age
        "#{self.name} - #{self.age}"
    end
end
