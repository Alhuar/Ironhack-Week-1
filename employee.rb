class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hourly_rate * @hours_worked
    end
end


class SalariedEmployee < Employee
    def initialize(name, email, yearly_rate)
        super(name, email)
        @yearly_rate = yearly_rate
        
    end

    def calculate_salary
      @yearly_rate / 52
    end
end


class MultiPaymentEmployee < Employee
    def initialize(name, email, yearly_rate, hourly_rate, hours_worked)
        super(name, email)
        @yearly_rate = yearly_rate
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
=begin
      	if @hours_worked > 40
      		@yearly_rate / 52 + @hourly_rate * @hours_worked
		else
			@yearly_rate / 52    
    	end
=end
		(@hours_worked > 40) ? @yearly_rate / 52 + @hourly_rate * @hours_worked : @yearly_rate / 52
#    The same as above, but in ternary
# first the (condtion) ? code to execute if condition is true : else

    end
end



class Payroll
    def initialize(employees)
        @employees = employees
    end

   	def notify_employee(employee)
   		puts "*************** EMAIL ***************"
   		puts "Name: " + employee.name
   		puts "Email: " + employee.email
   		puts "This month you will recieve " + employee.calculate_salary.to_s + "€."
    	puts "*************************************\n"
  	end

	def pay_employees
	  	total = @employees.reduce(0.0){|sum, emp| sum + emp.calculate_salary}

	  	@employees.each do |employee|
	  		puts employee.name + "===>" + employee.calculate_salary.to_s
	  		notify_employee(employee)
	  	end
	  	
	  	total += total * 0.18
	  	puts "\nTOTAL ==> " + total.to_s
	end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
mikel = HourlyEmployee.new('Mikel', 'mikel@ironhack.com',15, 50)
alfon = HourlyEmployee.new('Alfon', 'alfon@ironhack.com',15, 50)

employees = [josh, nizar, ted, mikel, alfon]
payroll = Payroll.new(employees)
payroll.pay_employees

