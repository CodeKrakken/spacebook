class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_valid?
    self.created_at + 600 > Time.now
  end

end
