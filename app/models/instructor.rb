class Instructor
  attr_reader :name

  @@ALL = []

  def initialize(name)
    @name = name
    @@ALL << self
  end

  # INSTANCE METHODS
  def passed_students
    binding.pry
  end

  def pass_student(student, test_name)
    found_test = find_test(test_name)
    if found_test
      found_test.test_status = "passed"
    else
      found_test = BoatingTest.new(student, test_name, "passed", self)
    end
    found_test
  end

  def fail_student(student, test_name)
    found_test = find_test(test_name)
    if found_test
      found_test.test_status = "failed"
    else
      found_test = BoatingTest.new(student, test_name, "falied", self)
    end
    found_test
  end

  def all_students
    students = []
    BoatingTest.all.each do |test|
        if test.instructor == self && !students.index(test.student)
            students << test.student
        end
    end
    students
  end

  #HELPER
  def find_test(test_name)
    BoatingTest.all.find do |test|
      test.test_name == test_name
    end
  end

  #CLASS METHODS
  def self.all
    @@ALL
  end
end
