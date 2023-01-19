require_relative './auth.rb'

class User
    extend Auth
    attr_accessor :id, :username, :password

    @@users = []

    def initialize(username, password)
        @username = username
        @password = password
        @id = User.all.count + 1
        @@users << self #push the users into the array.
    end

    def self.all
        @@users
    end

    def self.seed
        users = [{username: "john123", password: "password"}, 
                {username: "susan123", password: "password"}]

        i = 0

        while i < users.count
            user = users[i]
            User.new(user[:username], create_hash_digest(user[:password]))
            i += 1
        end
    end

    def self.find(id)
        self.all.find{ |user| user.id == id}
    end
end
