class Project < ApplicationRecord
    belongs_to :user
    has_many :contacts

    validates :name, presence: true
    validates :user_id, presence: true
end
