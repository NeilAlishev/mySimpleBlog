module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_by_author(author)
      return all unless author.present?

      self.author(author[:full_name])
    end
  end
end
