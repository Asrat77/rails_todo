class Todo < ApplicationRecord
  enum status: { incomplete: 0, complete: 1, in_progress: 2 }

  belongs_to :user
end
