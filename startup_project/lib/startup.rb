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
        accumulator = 0
        @employees.each {|e| accumulator += @salaries[e.title]}
        accumulator / @employees.size
    end

    def close
        @employees.clear
        @funding = 0
    end

    def acquire(other_startup)

        @funding += other_startup.funding
        @employees += other_startup.employees

        other_startup.salaries.each_pair do |title, wage|
            @salaries[title] = wage if !@salaries.has_key?(title)
        end

        other_startup.close

    end
end
