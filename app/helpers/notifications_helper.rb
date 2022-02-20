module NotificationsHelper

  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end


  def notification_form(notification)
    @comment=nil
    visitor=link_to notification.visitor.nickname, notification.visitor, class:"notifications"
    your_tweet=link_to 'あなたのSTORY', notification.tweet, class:"notifications"
    your_item =link_to 'あなたの商品', notification.item, class:"notifications"
    your_message =link_to 'メッセージ', notification.room, class:"notifications"
    case notification.action
      when "follow" then
        "#{visitor}さんがあなたをフォローしました"
      when "like" then
        "#{visitor}さんが#{your_tweet}にいいね！しました"
      when "tweetcomment" then
        # @comment=Comment.find_by(id:notification.comment_id)&.content
        if notification.tweet.user_id == notification.visited_id
          "#{visitor}さんがあなたの#{your_tweet}にコメントしました"
         else
           "#{visitor}さんが#{link_to notification.tweet.user.nickname + 'さんのSTORY',notification.tweet, class:"notifications"}にコメントしました"
         end
      when "itemlike" then
        "#{visitor}さんが#{your_item}にいいね！しました"
      when "comment" then
        # @comment=Comment.find_by(id:notification.tweet_comment_id)&.content
        if notification.item.user_id == notification.visited_id
         "#{visitor}さんがあなたの#{your_item}にコメントしました"
        else
          "#{visitor}さんが#{link_to notification.item.name,notification.item, class:"notifications"}にコメントしました"
        end
      when "message" then
        # @comment=Comment.find_by(id:notification.tweet_comment_id)&.content
        "#{visitor}さんから#{your_message}が届きました"
    end
  end
end
