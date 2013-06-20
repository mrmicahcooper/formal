require 'action_view'
require 'active_model'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/formal'))

class TestValid < Struct.new(:body)
  extend  ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def errors
    {}
  end
end

class TestInvalid < Struct.new(:body)
  extend  ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def errors
    { :body => ["ERROR"] }
  end
end

def fixture_locale(local_name)
  File.expand_path("../fixtures/locales/#{local_name}.yml", __FILE__)
end

module FormalSpecHelper
  include ActionView::Context if defined?(ActionView::Context)
  include ActionController::RecordIdentifier
  include ActionView::Helpers::FormHelper

  def path(*args)
    "/test_path"
  end
  alias :test_invalids_path :path
  alias :test_valids_path :path

  def protect_against_forgery?
    false
  end

  def with_builder(model = Post.new)
    @output = form_for(model, builder: Formal::FormBuilder) do |f|
      yield f
    end
  end
end
