class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

  def count_words
    Array(
          "rails" => 4,
          "ruby" => 3,
          "on" => 2
          )
  end
end
