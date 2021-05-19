class BoatingTest
    attr_reader :student, :test_name, :instructor
    attr_accessor :test_status

    @@ALL = []
    def initialize(student, test_name, test_status, instructor)
        @student = student
        @test_name = test_name
        @instructor = instructor
        @test_status = test_status
        @@ALL << self
    end

    def self.all
        @@ALL
    end

end
