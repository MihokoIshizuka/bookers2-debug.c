class ContactMailersController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
  end

  def create

    @group = Group.find(params[:group_id])
    @title = params[:title]
    @body = params[:body]

    mail = {
      :group => @group,
      :title => @title,
      :body => @body
    }

    ContactMailer.send_mails_to_group(mail)

    render :sent

  end

  def sent
    redirect_to group_join_path(params[:group_id])
  end

end
