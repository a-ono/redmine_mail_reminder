require_dependency 'project'

module RedmineMailReminder
  module ProjectPatch
    extend ActiveSupport::Concern
    included do
      has_many :mail_reminders, dependent: :destroy
    end
  end

  Project.send(:include, ProjectPatch)
end
