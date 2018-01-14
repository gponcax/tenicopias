module CMS
  module Docs
    class Create < ::BaseService
       attribute :id, Integer, writer: :private
       attribute :document, Tempfile, writer: :private
       attribute :name, String, writer: :private
       attribute :description, String, writer: :private

       ERROR_TITLE = 'Doc Error'.freeze

       def initialize(options={})
         self.id = options[:id]
         self.document = options[:document]
         self.name = options[:name]
         self.description = options[:description]
       end

       def call
         course = Course.find(id)
         return error(
                        response: course,
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'Group not found'
                      ) unless course

        doc = course.docs.create!(
                                document: ActionDispatch::Http::UploadedFile.new(document),
                                name: name,
                                description: description)

        success(doc)

       rescue ActiveRecord::RecordInvalid => e
         return error(
                        response: e.record,
                        title: ERROR_TITLE, code: 422,
                        message: 'Doc could not be added',
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
