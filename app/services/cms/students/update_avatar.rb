module CMS
  module Students
    class UpdateAvatar < ::BaseService
       attribute :id, Integer, writer: :private
       attribute :avatar, Tempfile, writer: :private

       ERROR_TITLE = 'Student Error'.freeze

       def initialize(options={})
         self.id = options[:id]
         self.avatar = options[:avatar]
       end

       def call
         student = Student.find(id)
         return error(
                        response: student,
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'Group not found'
                      ) unless student

        image = student.update!(
                                avatar: ActionDispatch::Http::UploadedFile.new(avatar)
                                )

       success image


       rescue ActiveRecord::RecordInvalid => e
         return error(
                        response: e.record,
                        title: ERROR_TITLE, code: 422,
                        message: 'Avatar could not be added',
                        errors: e.record.errors
                      )
       rescue => e
         return error(
                        response: e,
                        title: ERROR_TITLE,
                        message: e.message,
                        code: 422
                      )
     end
    end
  end
end
