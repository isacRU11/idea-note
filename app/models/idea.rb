class Idea < ApplicationRecord
    acts_as_taggable
    belongs_to :user
end
