require 'rails_helper'

describe 'Student Show Page' do
  describe 'As a user' do
    it 'shows student name, courses, and grade for each course' do
      student = Student.create!(name: 'David')
      course_1 = Course.create!(name: 'Math')
      course_2 = Course.create!(name: 'Engineering')
      course_3 = Course.create!(name: 'English')
      course_student_1 = student.course_students.create!(grade: 99.6, course_id: course_1.id)
      course_student_2 = student.course_students.create!(grade: 97.5, course_id: course_2.id)
      course_student_3 = student.course_students.create!(grade: 72.4, course_id: course_3.id)

      visit student_path(student)

      expect(page).to have_content(student.name)

      within "#course-#{course_1.id}" do
        expect(page).to have_content("Course Name: #{course_1.name}")
        expect(page).to have_content("Grade: #{course_student_1.grade}%")
      end

      within "#course-#{course_2.id}" do
        expect(page).to have_content("Course Name: #{course_2.name}")
        expect(page).to have_content("Grade: #{course_student_2.grade}%")
      end

      within "#course-#{course_3.id}" do
        expect(page).to have_content("Course Name: #{course_3.name}")
        expect(page).to have_content("Grade: #{course_student_3.grade}%")
      end
    end
  end
end
