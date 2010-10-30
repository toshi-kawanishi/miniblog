# -*- coding: utf-8 -*-
require 'spec_helper'

describe Post do
  fixtures :posts

  before(:each) do
  end

  it "バリデーションに失敗すること" do
    post = posts(:empty)
    post.should_not be_valid
  end

  it "バリデーションに成功すること" do
    post = posts(:full)
    post.should be_valid
  end

  it "タイトルだけ入れてもバリデーションに失敗すること" do
    post = posts(:title_only)
    post.should_not be_valid
  end

  it "本文だけ入れてもバリデーションに失敗すること" do
    post = posts(:content_only)
    post.should_not be_valid
  end

end

describe Post,"count_words が呼ばれた時" do
  fixtures :posts

  before(:each) do
  end

  it "count_words が rails=4, ruby=3, on=2 を返す" do
    post = posts(:short_content)
    actual = post.count_words()
    expected = Array(
      "rails" => 4,
      "ruby" => 3,
      "on" => 2
    )
    actual.should == expected
  end

  it "count_words が hoge=20 を返す" do
    post = posts(:hoge_20)
    actual = post.count_words()
    expected = Array(
      "hoge" => 20
    )
    actual.should == expected
  end

  it "count_words が hoge=15, fuga=5 を返す" do
    post = posts(:hoge_fuga)
    actual = post.count_words()
    expected = Array(
      "hoge" => 15,
      "fuga" => 5
    )
    actual.should == expected
  end
end

describe Post,"split_content が呼ばれた時" do
  fixtures :posts
  
  before(:each) do
  end
  
  it "split_content が内容を返す" do
    post = posts(:short_content)
    actual = post.split_content()
    expected = ["ruby", "ruby", "ruby", "rails", "rails", "rails", "rails", "on", "on"]
    actual.should == expected
  end
end

