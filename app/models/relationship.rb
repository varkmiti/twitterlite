class Relationship < ActiveRecord::Base
    belongs_to :followed, class_name: "User", foreign_key: :followed_id
    belongs_to :follower, class_name: "User", foreign_key: :follower_id

    validate :different_users

    def different_users
       if followed_id == follower_id
            errors.add(:follower_id, "You cannot follow yourself")
       end
    end
  end 