class RelationshipMailer < ApplicationMailer
  def new_follower(user, follower)
    @user = user
    @follower = follower
    ActiveDecorator::Decorator.instance.decorate(User)
    mail to: user.email, subject: "【お知らせ】フォローされました"
  end
end
