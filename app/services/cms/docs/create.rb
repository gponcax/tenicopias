module CMS
  module Docs
    class Create < ::BaseService
      ERROR_TITLE = 'Doc Error'.freeze

      attribute :document, Tempfile, writer: :private, required: true
      attribute :params, Hash, writer: :private, required: true

      def initialize(options = {})
        self.document = options["document"]
        self.params =  options.except("document")
      end

      def call
        doc = Doc.new(params)

        if document.present?
          doc.document = ActionDispatch::Http::UploadedFile.new(document)
        end
        doc.save!

        success(doc)
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'Doc could not be created', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
