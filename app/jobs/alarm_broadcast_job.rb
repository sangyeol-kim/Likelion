class AlarmBroadcastJob < ApplicationJob
    queue_as :default

    def perform(personal_message)
      message = render_message(personal_message)
      ActionCable.server.broadcast "alarms_#{personal_message.user.id}_channel",
                                   message: message,
                                   conversation_id: personal_message.conversation.id

      ActionCable.server.broadcast "alarms_#{personal_message.receiver.id}_channel",
                             alarm: render_alarm(personal_message),
                             message: message,
                             conversation_id: personal_message.conversation.id
    end

    private

    def render_alarm(message)
      AlarmsController.render partial: 'alarms/alarm', locals: {message: message}
    end

    def render_message(message)
      PersonalMessagesController.render partial: 'personal_messages/personal_message',
                                        locals: {personal_message: message}
    end
  end