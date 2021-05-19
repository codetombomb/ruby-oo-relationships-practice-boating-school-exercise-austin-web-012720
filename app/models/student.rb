class Student
    attr_reader :first_name

    @@ALL = []
    def initialize(first_name)
        @first_name = first_name
        @@ALL << self
    end
    
    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_instructors
        binding.pry
    end
    
    def grade_percentage
        tests = find_tests(self)
        percent = 0
        passed_test = tests.map do |test|
            test.test_status == 'passed' ? true : false
        end.filter{|v| v}.length
        if passed_test == 0
            percent = 0
        else
            percent = passed_test / tests.length.to_f * 100
        end
        percent
    end
    
    #HELPER
    def find_tests(student)
        tests = []
        BoatingTest.all.each do |test|
            if test.student == student && !tests.index(student)
                tests << test
            end
        end
        tests
    end
    
    def self.find_student(student_name)
        self.all.find do |student|
            student.first_name == student_name
        end
    end
    
    def self.all
        @@ALL
    end

end
