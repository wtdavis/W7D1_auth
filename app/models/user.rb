# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    #before validation set/check session token
    validates :session_token, :username, presence: true, uniqueness: true
    validates :password_digest, presence: true

    attr_reader :password

    def password=(pwd)
        self.password_digest = BCrypt::Password.create(pwd)
        @password = pwd
    end

    def is_password?(pwd)
        bcrypt_obj = BCrypt::Password.new(self.password_digest)
        bcrypt_obj.is_password?(pwd)
    end

    def self.find_by_credentials(username, pwd)
        
    end



end
