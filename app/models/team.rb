class Team < ApplicationRecord

   has_many :users, dependent: :destroy
   has_many :infos, dependent: :destroy
   has_many :team_records, dependent: :destroy
   has_many :post_comments, dependent: :destroy
   has_many :notifications, dependent: :destroy

   include JpPrefecture
   attachment :team_image

   def team_address
      teamname + ' ' + prefecture_code + city
   end

   validates :teamname, presence: true
   validates :prefecture_code, presence: true
   validates :city, presence: true
   validates :team_address, presence: true

   def create_notification_comment!(current_user, post_comment_id)
     # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
     temp_ids = Comment.select(:user_id).where(team_id: id).where.not(user_id: current_user.id).distinct
     temp_ids.each do |temp_id|
       save_notification_comment!(current_user, post_comment_id, temp_id['user_id'])
     end
     # まだ誰もコメントしていない場合は、投稿者に通知を送る
   # save_notification_comment!(current_user, post_comment_id, user_id) if temp_ids.blank?
   end

   def save_notification_comment!(current_user, post_comment_id, visited_id)
     # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
     notification = current_user.active_notifications.new(
       team_id: id,
       comment_id: post_comment_id,
       visited_id: visited_id,
     )
     # 自分の投稿に対するコメントの場合は、通知済みとする
     if notification.visitor_id == notification.visited_id
       notification.checked = true
     end
     notification.save if notification.valid?
   end

end
