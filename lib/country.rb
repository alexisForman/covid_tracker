class Country
    attr_accessor :name, :overall_cases, :confirmed_deaths, :recoveries
    @@records = [] #This is a class property.

    def initialize(country_name, country_cases, country_deaths, country_recoveries)  #This method is the equivalent to a js constructor.
        @name = country_name
        @overall_cases = country_cases
        @confirmed_deaths = country_deaths
        @recoveries = country_recoveries

        @@records << self
    end

    def self.all
        @@records
    end

end

