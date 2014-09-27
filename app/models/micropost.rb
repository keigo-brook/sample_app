class Micropost < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order('created_at DESC')}
    validates :content, presence: true, length: { maximum: 140 }
    validates :user_id, presence: true

    #userがフォローしているユーザーのマイクロポストを返す
    def self.from_users_followed_by(user)
        followed_user_ids = user.followed_user_ids
        where("user_id IN (:followed_user_ids) OR user_id = :user_id",
                followed_user_ids: followed_user_ids, user_id: user)        
    end
end
