require 'redmine'
require 'redmine_mail_reminder'

Rails.application.config.to_prepare do
  RedmineMailReminder.apply_patch
end

ActionMailer::Base.default :skip_premailer => true

require 'premailer_ext/file_system_loader_extensions'

Redmine::Plugin.register :redmine_mail_reminder do
  name 'Redmine Mail Reminder plugin'
  author 'Jethro'
  description 'Issue reminder plugin for Redmine, based on Ascendro S.R.L version https://github.com/ascendro/redmine_issue_reminder '
  version '3.0.0.0001'
  url 'https://github.com/Hopebaytech/redmine_mail_reminder'
  requires_redmine :version_or_higher => '3.0.0'

  settings( :default => { 'email_subject' => :default_email_subject},
            :partial => 'reminder_settings/issue_reminder_settings')
  
  project_module :issue_reminder do
    permission :view_issue_reminder, :mail_reminders => [:index, :edit, :create, :update, :destroy]
  end
   
  if_proc = Proc.new{|project| project.enabled_module_names.include?('issue_reminder')}
  menu :project_menu,
    :issue_reminder,
    { :controller => 'mail_reminders', :action => 'index' },
    :caption => :issues_reminder,
    :last => true,
    #:after => :activity,
    :param => :project_id,
    :if => if_proc

#  menu :application_menu, :issue_reminder, { :controller => 'reminders', :action => 'index' }, :caption => :usses_reminder

end
