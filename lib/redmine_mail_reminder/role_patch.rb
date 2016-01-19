require_dependency 'role'

module RedmineMailReminder
  module RolePatch
    extend ActiveSupport::Concern
    included do
      has_many :reminder_roles, dependent: :destroy
    end
  end

  Role.send(:include, RolePatch)
end
