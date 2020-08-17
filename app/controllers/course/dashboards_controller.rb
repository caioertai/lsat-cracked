class Course::DashboardsController < Course::ApplicationController
  def show
    authorize :course
    @section = Section.first
    redirect_to course_section_path(@section)
  end
end
