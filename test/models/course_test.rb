require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course has unique title" do
    testCourse = Course.new(title: "java")
    assert testCourse.title == "java"
  end
  # test "the truth" do
  #   assert true
  # end
end
