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

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            desc 'Docs'
            namespace :docs do
              get serializer: ::Client::Docs::DocSerializer do
                result = ::Client::Courses::FindDocs.call(params)
                if result.succeed?
                  result.response
                else
                  error!({ message: result.message, errors: result.errors }, result.code)
                end
              end
            end
          end
        end
      end
    end
  end
end
