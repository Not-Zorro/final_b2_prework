require 'rails_helper'

describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many :students }
  end

  describe 'instance methods' do
    it 'returns students ordered by grade for course' do
      course_1 = Course.create!(name: 'Math')
      student_1 = Student.create!(name: 'David')
      student_2 = Student.create!(name: 'Graham')
      student_3 = Student.create!(name: 'Zac')
      student_1.course_students.create!(grade: 99.6, course_id: course_1.id)
      student_2.course_students.create!(grade: 93.7, course_id: course_1.id)
      student_3.course_students.create!(grade: 83.4, course_id: course_1.id)

      expected = [student_1, student_2, student_3]

      expect(course_1.students_ordered).to eq(expected)
    end
  end
end
