module Tecnicopias
  module CMS
    module V1
      class Courses < Base
        namespace :courses do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Course List'
          params do
            use :pagination
          end

          get each_serializer: ::CMS::Courses::CourseSerializer do
            paginate  Course.page(params[:page]).per(params[:per_page])
          end


          desc 'Create Course'
          params do
            requires :name, allow_blank: false, type: String
            requires :description, allow_blank: false, type: String
          end

          post serializer: ::CMS::Courses::CourseSerializer do
            status 201

            result = ::CMS::Courses::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            desc 'Course Detail'
            get serializer: ::CMS::Courses::CourseSerializer do
              result = ::CMS::Courses::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Update Course'
            params do
              requires :name, allow_blank: false, type: String
              requires :description, allow_blank: false, type: String
            end
            put do
              status 204

              result = ::CMS::Courses::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            namespace :students do
              params do
                use :pagination
              end

              desc 'Students'
              get serializer: ::CMS::Students::StudentSerializer do
                result = ::CMS::Courses::FindStudents.call(params[:id])

                if result.succeed?
                  paginate result.response
                else
                  error!({ message: result.message, errors: result.errors }, result.code)
                end
              end
            end

            namespace :docs do
              desc 'Add new Doc'
              params do
                requires :description, type: String, allow_blank: false
                requires :name, type: String, allow_blank: false
                requires :document, type: File, allow_blank: false
              end
              post serializer: ::CMS::Courses::CourseSerializer do
                status 201
                result = ::CMS::Docs::Create.call(params)

                if result.succeed?
                  result.response
                else
                  error!(
                          {
                            message: result.message,
                            errors: result.errors
                          }, result.code
                        )
                end
              end
              desc 'List docs'
              params do
                use :pagination
              end
              get serializer: ::CMS::Docs::DocSerializer do
                result = ::CMS::Courses::FindDocs.call(params[:id])

                if result.succeed?
                  paginate result.response
                else
                  error!({ message: result.message, errors: result.errors }, result.code)
                end
              end
            end

            desc 'Delete Course'
            delete do
              status 204

              result = ::CMS::Courses::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
