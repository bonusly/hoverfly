# frozen_string_literal: true

module Hoverfly
  module Models
    class Base
      def self.repositories
        Hoverfly.environment.repositories
      end

      def self.unique_id
        Util.generate_id(self::RESOURCE_ID_PREFIX)
      end

      def self.load_fixtures(*args)
        args.each do |arg|
          define_singleton_method("#{arg}_fixture") do
            instance_variable_get("@#{arg}_fixture") ||
              instance_variable_set("@#{arg}_fixture", JSON.parse(File.read("#{File.dirname(__FILE__)}/../fixtures/#{arg}.json")))
          end
        end
      end
    end
  end
end
