class Totalpost < ApplicationRecord
  include SearchCop
  has_many :histories
  has_many :recommend_posts
  acts_as_votable
  paginates_per 50
  search_scope :search do
    attributes :source, :title, :posttext, :post_attribute
  end

  def self.dedupe 
    # find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.title,model.posttext,model.source] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.pop # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
end
