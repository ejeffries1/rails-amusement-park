class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if self.nausea && self.happiness
            if self.happiness > self.nausea
            "happy"
            else
                self.nausea > self.happiness
            "sad"
            end
        end
    end
end
