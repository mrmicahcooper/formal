module Formal
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates the Formal initializer at config/initializers/formal.rb"

      def self.source_root
        @source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_initializer_file
        template "initializer.rb", "config/initializers/formal.rb"
      end
    end
  end
end
