module CMS
  module Groups
    class AddDoc < ::BaseService
       attribute :group_id, Integer, writer: :private
       attribute :doc_params, Tempfile, writer: :private

       ERROR_TITLE = 'Doc Error'.freeze

       def initialize(options={})
         self.group_id = options[:group_id]
         self.doc_params = options
       end

       def call
         group = Group.find_by(id: group_id)
         return error(
                        response: group,
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'Group not found'
                      ) unless group

        doc = group.docs.create!(doc_params)
        success(doc)
       rescue ActiveRecord::RecordInvalid => e
         return error(
                        response: e.record,
                        title: ERROR_TITLE, code: 422,
                        message: 'Product Image could not be added',
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
