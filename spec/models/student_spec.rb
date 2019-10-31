require 'rails_helper'

describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many :courses }
  end

  describe 'instance methods' do
    it 'returns the grade tied to that student in that course' do
      student = Student.create!(name: 'David')
      course_1 = Course.create!(name: 'Math')
      course_student_1 = student.course_students.create!(grade: 99.6, course_id: course_1.id)

      expect(student.grade(course_1)).to eq(99.6)
    end
  end
end
