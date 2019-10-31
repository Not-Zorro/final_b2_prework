require 'rails_helper'

describe 'Course Show Page' do
  describe 'As a user' do
    it 'shows courses name and students ordered by grade' do
      course_1 = Course.create!(name: 'Math')
      student_1 = Student.create!(name: 'David')
      student_2 = Student.create!(name: 'Graham')
      student_3 = Student.create!(name: 'Zac')
      student_1.course_students.create!(grade: 99.6, course_id: course_1.id)
      student_2.course_students.create!(grade: 93.7, course_id: course_1.id)
      student_3.course_students.create!(grade: 83.4, course_id: course_1.id)

      visit course_path(course_1)

      expect(page).to have_content(course_1.name)

      within "#student-0" do
        expect(page).to have_content(student_1.name)
      end

      within "#student-1" do
        expect(page).to have_content(student_2.name)
      end

      within "#student-2" do
        expect(page).to have_content(student_3.name)
      end
    end
  end
end
