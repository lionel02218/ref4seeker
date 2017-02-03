class UserMailer < ApplicationMailer
  default from: "ref4seeker@client.com"

  def reply(answer_id, message)
    answer = Answer.find(answer_id)
    @user = answer.user
    @message = message
    mail to: @user.email, subject: "Reply"
  end
end
