class RecommendPost < ApplicationRecord
  belongs_to :totalpost
  belongs_to :user
  paginates_per 20
end
