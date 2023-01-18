require 'bCrypt'
require 'pry'

module Auth
    def create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    def authenticate_user(users,username, password)
        currUser = nil
        users.each do |user|
            if user.username == username && user.password = password
                #Logged in successfully!
                currUser =  user
                break;
            end
        end
        
        return currUser
    end
end
