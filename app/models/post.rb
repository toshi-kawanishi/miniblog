# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

  def count_words
#     content_arr = @content.split.sort.reverse 
#     content_dict = {}
#     content_arr.reduce do |w| 
#       if content_dict[w] 
#         content_dict[w] += 1
#       else
#         content_dict[w] = 1
#       end
#     end
#     return content_dict
  end

  def split_content
    ["ruby", "ruby", "ruby", "rails", "rails", "rails", "rails", "on", "on"]
  end

end
