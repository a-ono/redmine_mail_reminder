module RedmineMailReminder
  def self.apply_patch
    require_dependency 'redmine_mail_reminder/role_patch'
    require_dependency 'redmine_mail_reminder/query_patch'
    require_dependency 'redmine_mail_reminder/project_patch'
  end
end
