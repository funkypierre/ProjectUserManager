class Contact < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :email, presence: true
    validates :user_id, presence: true
end
