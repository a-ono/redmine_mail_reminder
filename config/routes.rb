RedmineApp::Application.routes.draw do
  scope "projects/:project_id", as: 'project' do
    resources :mail_reminders
  end
end
