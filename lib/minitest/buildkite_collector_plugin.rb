# frozen_string_literal: true

require_relative "../buildkite/test_collector"
require_relative "../buildkite/test_collector/minitest_plugin/reporter"

Buildkite::TestCollector.uploader = Buildkite::TestCollector::Uploader

module Minitest
  def self.plugin_buildkite_collector_init(options)
    if defined?(Buildkite::TestCollector::MinitestPlugin) && Buildkite::TestCollector.respond_to?(:uploader)
      self.reporter << Buildkite::TestCollector::MinitestPlugin::Reporter.new(options[:io], options)
    end
  end
end
