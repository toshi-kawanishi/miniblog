# -*- coding: utf-8 -*-
require 'spec_helper'

describe Post do
  before(:each) do
    @post = Post.new
  end

  it "バリデーションに失敗すること" do
    @post.should_not be_valid
  end

  it "バリデーションに成功すること" do
    @post.title = "test"
    @post.content = "This is a test post."
    @post.should be_valid
  end

  it "タイトルだけ入れてもバリデーションに失敗すること" do
    @post.title = "test"
    @post.should_not be_valid
  end

  it "本文だけ入れてもバリデーションに失敗すること" do
    @post.content = "This is a test post."
    @post.should_not be_valid
  end

end
