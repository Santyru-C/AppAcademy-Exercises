require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        @funding > other_startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "Title does not exist"
        end
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        amount = @salaries[employee.title]
        if @funding >= amount
            @funding -= amount
            employee.pay(amount)
        else
            raise "Not enough fundings"
        end
    end

    def payday
        @employees.each {|e| pay_employee(e)}
    end

    def average_salary
        @employees.inject {|a, e| a + @salaries[e.title]} / @employees.size
    end
end
