require 'spec_helper'

describe Formal::FormBuilder do
  include FormalSpecHelper

  before do
    @post = Post.new
    @output = ''
  end

  it 'should yield the formal builder' do
    form_for(@post, builder: described_class) do |f|
      f.should be_kind_of(described_class)
    end
  end

  it 'should wrap check box with label inside' do
    with_builder do |f|
      f.check_box_with_label :published
    end
    expected = %q{<dt><label for="post_published"><input name="post[published]" type="hidden" value="0" /><input id="post_published" name="post[published]" type="checkbox" value="1" /> published</label></dt>}
    output.should include(expected)
  end

  context "with error" do
    let(:invalid_post) { InvalidPost.new }
  end
end
