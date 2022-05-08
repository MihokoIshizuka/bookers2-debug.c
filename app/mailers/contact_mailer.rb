class ContactMailer < ApplicationMailer

  def send_mail(user, mail)
    @group = mail[:group]
    @title = mail[:title]
    @body = mail[:body]

    @mail = ContactMailer.new()
    mail(
      from: ENV['MAIL_ADDRESS'],
      to: user.email,
      subject: 'New Event Notice!!'
      )
  end

  def self.send_mail_to_group(mail)
    group = mail[:group]
    group.users.each do |user|
      ContactMailer.send_mail(user, mail).deliver_now
    end
  end
end
