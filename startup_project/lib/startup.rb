require_relative "employee"
class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title) ? true : false
    end

    def >(another_startup)
        self.funding > another_startup.funding ? true : false
    end 

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "Error"
        end
    end
    def size
        @employees.length
    end

    def pay_employee(employee_instance)
        employee_salary = @salaries[employee_instance.title]
        if @funding > employee_salary
            employee_instance.pay(employee_salary)
            @funding -= employee_salary
        else
            raise "Out of funding"
        end 
    end

    def payday
        @employees.map {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each {|employee| sum += @salaries[employee.title]}
        sum / @employees.length
    end 
    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += another_startup.employees
        another_startup.close
    end
end


# chu y line 242 rspec: should add the given startup's salaries to our @salaries, without overwriting any of our existing @salaries" do
# nghia là chỉ add những title và salary mà current startup chưa có, nếu có rồi thì khỏi add, để trả lương cho chức vụ đó (bên another_startup) theo như chính sachh của current startup, vì add nó sẽ overwrite và thay đổi theo another_startup. 