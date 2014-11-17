class Todo < ActiveRecord::Base

  belongs_to :user
	validates :description, presence: true

	default_scope { where(:complete => false).order('created_at DESC')}

  def expires_at
    created_at + 1.week
  end
end
