module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @reply = nil 
    @right = nil 
    @support = nil 
    your_post = link_to 'あなたの投稿', post_path(notification), style:"font-weight: bold;"
    @visiter_reply = notification.reply_id
    @visiter_right = notification.right_id
    @visiter_support = notification.support_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "reply" then
        @reply = Reply.find_by(id: @visiter_reply)&.caption
        tag.a(@visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id), style:"font-weight: bold;")+"にコメントしました"
      when "right" then
        @right = Right.find_by(id: @visiter_right)&.content
        tag.a(@visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id), style:"font-weight: bold;")+"に権利チップを送りました"
      when "support" then
        @support = Support.find_by(id: @visiter_support)&.message
        tag.a(@visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id), style:"font-weight: bold;")+"に応援チップを送りました"
    end
  end
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
