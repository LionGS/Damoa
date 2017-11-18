class ScrapedPost < ApplicationRecord
  belongs_to :user
  belongs_to :totalpost
  paginates_per 50
end
