# frozen_string_literal: true

module Buildkite::TestCollector
  class Logger < ::Logger
    class Formatter < ::Logger::Formatter
      def call(severity, time, _program, message)
        "#{time.utc.iso8601(9)} pid=#{::Process.pid} tid=#{::Thread.current.object_id} #{severity}: #{message}\n"
      end
    end

    def initialize(*args, **kwargs)
      super
      self.formatter = Buildkite::TestCollector.log_formatter
    end
  end
end
