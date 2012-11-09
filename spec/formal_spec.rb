require 'spec_helper'

describe Formal do
  include FormalSpecHelper

  before do
    @post = Post.new
    @output = ''
  end

  it 'should yield the formal builder' do
    form_for(@post, builder: Formal::Builder) do |f|
      f.should be_kind_of(Formal::Builder)
    end
  end

  it 'should wrap input inside dd tag' do
    with_builder do |f|
      f.text_field :body
    end

    expected = %q{<dd><input id="post_body" name="post[body]" size="30" type="text" /></dd>}
    output.should include(expected)
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

    it 'should add error class ONLY to the erroneous dd tag' do
      with_builder(invalid_post) { |f| f.text_field :body }
      expected_error = %q{<dd class="error"><input id="invalid_post_body" name="invalid_post[body]" size="30" type="text" /></dd>}
      output.should include(expected_error)
    end

    it "does not add the error class to non erroneous dd tags" do
      with_builder(invalid_post) { |f| f.text_field :title }
      expected_error = %q{<dd><input id="invalid_post_title" name="invalid_post[title]" size="30" type="text" /></dd>}
      output.should include(expected_error)
    end

  end
end
