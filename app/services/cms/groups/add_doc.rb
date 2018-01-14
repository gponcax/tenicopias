module CMS
  module Groups
    class AddDoc < ::BaseService
       attribute :group_id, Integer, writer: :private
       attribute :doc, Tempfile, writer: :private
       attribute :name, String, writer: :private
       attribute :description, String, writer: :private

       ERROR_TITLE = 'Doc Error'.freeze

       def initialize(options={})
         self.group_id = options[:group_id]
         self.doc = options[:document]
         self.name = options[:name]
         self.description = options[:description]
       end

       def call
         group = Group.find_by(id: group_id)
         return error(
                        response: group,
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'Group not found'
                      ) unless group

        doc = group.docs.create!(
                                document: ActionDispatch::Http::UploadedFile.new(doc),
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
