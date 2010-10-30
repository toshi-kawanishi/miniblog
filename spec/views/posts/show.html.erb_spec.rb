require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "short_content",
      :content => "on rails ruby ruby rails rails ruby rails on nutshell"
    ))
  end

  it "shows the destination" do
    render
    rendered.should match(/ruby/)
    rendered.should match(/rails/)
    rendered.should match(/on/)
    rendered.should match(/\(4\)/)
    rendered.should match(/\(3\)/)
    rendered.should match(/\(2\)/)
  end
end
