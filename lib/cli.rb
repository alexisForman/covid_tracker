require_relative './user.rb'
require_relative './auth.rb'

class CLI
    extend Auth
    def run
        User.seed
        system("clear")
        greeting
        login_or_signup
        while menu != 'exit'
        end
        end_program
    end

    def login_or_signup
        response = ""

        while response != 'login' && response != 'signup'
            puts "Would you like to login or signup?"
            response = gets.chomp
        end

        if response == 'login'
            login
        else 
            signup
        end
    end

    def sign_up
        puts "Great! Enter a username youd like to be known by."
        username = gets.chomp
        puts "Great! Now choose a password."
        password = gets.chomp
        User.new(username, password)
        login
    end

    def login
        authenticated = false

        while authenticated != true
            puts "Please log in."
            puts "> What is your username?"
            username = gets.chomp
            puts "> What is your password?"
            password = gets.chomp

            if Auth.authenticate_user(User.all, username, password)
                puts "login successful!"
                authenticated = true
            else
                puts "Login failed. Please try again."
            end
        end
    end

    def greeting
        puts "Welcome to the   COVID CLI tracker."
    end

    def end_program
        puts 'See you later!'
    end

    def menu
        list_options
        puts "Which do you prefer?"
        input = gets.chomp
        choose_option(input)
        return input
    end

    def list_options
        puts "1.    "
        puts "2     "
        puts "3     "
    end

    def choose_option(input)
        case input
            when "1"
                puts "Number one was chosen."
            when "2"
                puts "Number two was chosen."
            when "3"
                puts "Number three was chosen."
        end
    end
end