module Tecnicopias
  module CMS
    module V1
      class Groups < Base
        namespace :ciclos do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Ciclo List'
          params do
            use :pagination
          end

          get each_serializer: ::CMS::Groups::GroupSerializer do
            paginate  Group.all.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            desc 'Ciclo Detail'
            get serializer: ::CMS::Groups::GroupSerializer do
              result = ::CMS::Groups::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

           namespace :courses do
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
             desc 'Courses by Ciclo'
             get serializer: ::CMS::Courses::CourseSerializer do
               result = ::CMS::Groups::Find.call(params[:id])

               if result.succeed?
          
                 result.response.courses
               else
                 error!({ message: result.message, errors: result.errors }, result.code)
               end
             end
           end

            desc 'Update Ciclo'
            params do
              optional :name, allow_blank: false, type: String
              optional :description, allow_blank: false, type: String
            end
            put do
              status 204

              result = ::CMS::Groups::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete Ciclo'
            delete do
              status 204

              result = ::CMS::Groups::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
