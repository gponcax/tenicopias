module CMS
  module Claims
    class FindDocs < ::BaseService


      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        course = Course.find(id)
        docs = course.docs
        return error(
          title:  "Claim Error",
          code: 404,
          message: 'Course not found'
        ) unless docs

        success(docs)
      end
    end
  end
end
