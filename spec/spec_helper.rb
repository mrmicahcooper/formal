require 'action_view'
require 'active_model'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/formal'))
require 'formal'

class Post < Struct.new(:body, :published)
  extend  ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def errors
    {}
  end
end

class InvalidPost < Struct.new(:body, :title)
  extend  ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def errors
    { :body => ["can't be blank"] }
  end
end

module FormalSpecHelper
  include ActionView::Context if defined?(ActionView::Context)
  include ActionController::RecordIdentifier
  include ActionView::Helpers::FormHelper

  def posts_path(*args)
    "/posts"
  end
  alias :invalid_posts_path :posts_path

  def protect_against_forgery?
    false
  end

  def with_builder(model = Post.new)
    @output = form_for(model, builder: Formal::FormBuilder) do |f|
      yield f
    end
  end

  def output
    @output
  end
end
