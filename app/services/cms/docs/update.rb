module CMS
  module Docs
    class Update < ::BaseService
       attribute :id, Integer, writer: :private
       attribute :document, Tempfile, writer: :private
       attribute :params, Hash, writer: :private

       ERROR_TITLE = 'Doc Error'.freeze

       def initialize(options={})
         self.id = options[:id]
         self.document = options[:document]
         self.params = options.except(:document)
       end

       def call
         doc = Doc.find(id)
         return error(
                        response: doc,
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'Doc not found'
                      ) unless doc
          doc_update = doc.update(params)

          unless document.nil?
            doc_open = ActionDispatch::Http::UploadedFile.new(document)
            doc.update(document: doc_open)
          end

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
