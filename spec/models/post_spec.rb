# -*- coding: utf-8 -*-
require 'spec_helper'

describe Post, "モデル" do
  describe "バリデーション" do
    fixtures :posts

    before(:each) do
    end

    describe "タイトルも本文も入っている時" do
      it "成功する" do
        post = posts(:full)
        post.should be_valid
      end
    end

    describe "タイトルも本文も入っていない時" do
      it "失敗する" do
        post = posts(:empty)
        post.should_not be_valid
      end
    end

    describe "タイトルだけ入っている時" do
      it "失敗する" do
        post = posts(:title_only)
        post.should_not be_valid
      end
    end

    describe "本文だけ入っている時" do
      it "失敗する" do
        post = posts(:content_only)
        post.should_not be_valid
      end
    end
  end

  describe Post, ".count_words()" do
    fixtures :posts

    before(:each) do
    end

    describe "本文に hoge が20回含まれる時" do
      it "1単語ぶんの配列を返す" do
        post = posts(:hoge_20)
        actual = post.count_words()
        expected = Array(
          "hoge" => 20
        )
        actual.should == expected
      end
    end

    describe "本文に hoge が15回, fuga が5回含まれる時" do
      it "2単語ぶんの配列を返す" do
        post = posts(:hoge_fuga)
        actual = post.count_words()
        expected = Array(
          "hoge" => 15,
          "fuga" => 5
        )
        actual.should == expected
      end
    end

    describe "本文に rails が4回, ruby が3回, on が2回, nutshell が1回含まれる時" do
      it "先頭3単語ぶんの配列を返す" do
        post = posts(:short_content)
        actual = post.count_words()
        expected = Array(
          "rails" => 4,
          "ruby" => 3,
          "on" => 2
        )
        actual.should == expected
      end
    end
  end

  describe Post, ".split_content()" do
    fixtures :posts
  
    before(:each) do
    end
  
    it "本文に含まれる単語をソートして返す" do
      post = posts(:short_content)
      actual = post.split_content()
      expected = ["nutshell",
                  "on", "on",
                  "rails", "rails", "rails", "rails",
                  "ruby", "ruby", "ruby"]
      actual.should == expected
    end
  end
end
