module Tecnicopias
  module CMS
    module V1
      class Teachers < Base

        namespace :teacher_courses do
          before do
            doorkeeper_authorize! :teacher
          end

          desc 'Create course from the teacher'
          params do
            requires :name, allow_blank: false, type: String
            requires :description, allow_blank: false, type: String
            requires :start_time, allow_blank: false, type: String
            requires :end_time, allow_blank: false, type: String
          end

          post serializer: ::CMS::Courses::CourseSerializer do
            result = ::CMS::Courses::Teachers::Create.call(current_resource_owner, params)
            if result.succeed?
              result.response
            else
            error!({ message: result.message, errors: result.errors },
                   result.code)
            end
          end

          desc 'Courses List from the teacher'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Courses::CourseSerializer do
            paginate current_resource_owner.courses.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false do
            desc 'Teacher Detail from the teache'
            get serializer: ::CMS::Courses::CourseSerializer do
              result = ::CMS::Courses::Teachers::Find.call(current_resource_owner, params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end
          end

        end


        namespace :teachers do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Create Teacher'
          params do
            requires :name, allow_blank: false, type: String
            requires :carnet, allow_blank: false, type: String
            requires :schools, allow_blank: false, type: String
            requires :email, allow_blank: false, regexp: Devise::email_regexp, type: String
            requires :phone, allow_blank: false, type: String
            optional :birthdate, allow_blank: false, type: Date
            requires :password, allow_blank: false, type: String,
                     documentation: { type: 'password' }
            given :password do
              requires :password_confirmation, allow_blank: false, type: String,
                       documentation: { type: 'password' }
            end
          end
          post serializer: ::CMS::Teachers::TeacherSerializer do
            status 201
            result = ::CMS::Teachers::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          desc 'Teacher List'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Teachers::TeacherSerializer do
            paginate Teacher.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false do
            desc 'Teacher Detail'
            get serializer: ::CMS::Teachers::TeacherSerializer do
              result = ::CMS::Teachers::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Update Teacher'
            params do
              optional :name, allow_blank: false, type: String
              optional :carnet, allow_blank: false, type: String
              optional :schools, allow_blank: false, type: String
              optional :email, allow_blank: false, regexp: Devise::email_regexp, type: String
              optional :phone, allow_blank: false, type: String
              optional :birthdate, allow_blank: false, type: Date
              optional :password, allow_blank: false, type: String,
                       documentation: { type: 'password', required: false }
              given :password do
                requires :password_confirmation, allow_blank: false, type: String,
                         documentation: { type: 'password', required: false }
              end
            end
            put do
              status 204

              result = ::CMS::Teachers::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            namespace :courses do
              desc 'Create course'
              params do
                requires :name, allow_blank: false, type: String
                requires :description, allow_blank: false, type: String
                requires :start_time, allow_blank: false, type: String
                requires :end_time, allow_blank: false, type: String
              end
              post serializer: ::CMS::Courses::CourseSerializer do
                result = ::CMS::Courses::Create.call(params)
                if result.succeed?
                  result.response
                else
                error!({ message: result.message, errors: result.errors },
                       result.code)
                end
              end
            end

            desc 'Delete Teacher'
            delete do
              status 204

              result = ::CMS::Teachers::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
