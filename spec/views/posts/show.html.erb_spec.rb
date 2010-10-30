# -*- coding: utf-8 -*-
require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "short_content",
      :content => "on rails ruby ruby rails rails ruby rails on nutshell"
    ))
  end

  it "頻出単語を表示する" do
    render

    rendered.should have_selector('ul')
    rendered.should have_selector('li')
    rendered.should have_selector('span')

    rendered.should contain("ruby")
    rendered.should contain("rails")
    rendered.should contain("on")
    rendered.should contain("(4)")
    rendered.should contain("(3)")
    rendered.should contain("(2)")
  end
end
