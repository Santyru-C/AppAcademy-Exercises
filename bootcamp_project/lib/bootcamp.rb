class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h, k| h[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(new_teacher)
        @teachers << new_teacher
    end

    def enroll(new_student)
        if @students.size < @student_capacity
            @students << new_student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.size / @teachers.size
    end

    def add_grade(stdnt, grd)
        if enrolled?(stdnt)
            @grades[stdnt] << grd
            return true
        else
            return false
        end
    end

    def num_grades(stdnt)
        @grades[stdnt].size
    end

    def average_grade(stdnt)
        grades = @grades[stdnt]
        if !enrolled?(stdnt) or grades.size == 0
            return nil
        else
            grades.sum / grades.size
        end
    end

end