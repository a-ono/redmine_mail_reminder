require_dependency 'query'

module RedmineMailReminder
  module QueryPatch
    extend ActiveSupport::Concern
    included do
      has_many :mail_reminders, dependent: :destroy
    end
  end

  Query.send(:include, QueryPatch)
end
