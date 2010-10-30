# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

  def count_words
    content_arr = split_content
    content_dict = {}
    content_arr.map do |w| 
      if content_dict[w] 
        content_dict[w] += 1
      else
        content_dict[w] = 1
      end
    end
    results = content_dict.sort do |e1, e2|
      e1[1] <=> e2[1]
    end
    results.reverse[0,3]
  end

  def split_content
    content.split.sort.reverse
  end
end
