class MailRemindersController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id
  before_filter :authorize

  def index
    @reminders = MailReminder.where(project_id: @project)
    @reminder = MailReminder.new
  end

  def edit
    @reminder = MailReminder.find(params[:id])
  end

  def create
    @reminder = MailReminder.new
    @reminder.project = @project
    @reminder.update_attributes(reminder_params)
  end

  def update
    @reminder = MailReminder.find(params[:id])
    @reminder.update_attributes(reminder_params)
  end

  def destroy
    @reminder = MailReminder.find(params[:id])
    @reminder.destroy
  end

  private

  def reminder_params
    params.require(:reminder).permit(:query_id, :interval, :interval_value, role_ids: [])
  end
end
