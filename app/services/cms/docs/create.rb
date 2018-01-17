module CMS
  module Docs
    class Create < ::BaseService
       attribute :id, Integer, writer: :private
       attribute :document, Tempfile, writer: :private
       attribute :name, String, writer: :private
       attribute :description, String, writer: :private
       attribute :price, Integer, writer: :private
       attribute :page_numbers, Integer, writer: :private

       ERROR_TITLE = 'Doc Error'.freeze

       def initialize(options={})
         self.id = options[:id]
         self.document = options[:document]
         self.name = options[:name]
         self.description = options[:description]
         self.price = options[:price]
         self.page_numbers = options[:page_numbers]
       end

       def call
         course = Course.find(id)
         return error(
                        response: course,
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'Group not found'
                      ) unless course

          doc_open = ActionDispatch::Http::UploadedFile.new(document)
          doc = course.docs.create!(
                                document: doc_open,
                                mime_type: doc_open.content_type,
                                file_size: doc_open.size,
                                name: name,
                                price: price,
                                page_numbers: page_numbers,
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
