# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

  def count_words
    words = split_content
    word_counts = {}

    words.map do |w|
      if word_counts[w]
        word_counts[w] += 1
      else
        word_counts[w] = 1
      end
    end

    results = word_counts.sort do |e1, e2|
      e1[1] <=> e2[1]
    end

    results.reverse[0,3]
  end

  def split_content
    content.split.sort
  end
end
