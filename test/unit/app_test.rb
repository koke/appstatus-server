require 'test_helper'

class AppTest < ActiveSupport::TestCase
  test "version_reports works" do
    @app = apps(:ibizi)
    assert_equal(0, @app.reports.count)
    assert_equal(0, @app.reports.this_version.count)
    assert_equal(:working, @app.status)
    @app.reports.create!(:app_version => "1.0.1")
    assert_equal(1, @app.reports.count)
    assert_equal(0, @app.reports.this_version.count)
    assert_equal(:working, @app.status)
    @app.reports.create!(:app_version => "1.0.2")
    assert_equal(2, @app.reports.count)
    assert_equal(1, @app.reports.this_version.count)
    assert_equal(:probably, @app.status)
  end
end
