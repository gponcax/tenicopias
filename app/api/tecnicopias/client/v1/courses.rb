module Tecnicopias
  module Client
    module V1
      class Courses < Base
        namespace :courses do
          before do
            doorkeeper_authorize! :student
          end

          desc 'Course List'
          params do
            use :pagination
          end

          get each_serializer: ::Client::Courses::CourseSerializer do
            paginate  current_resource_owner.courses.page(params[:page]).per(params[:per_page])
          end
        end
      end
    end
  end
end
