require 'helper'

class TestStathat < MiniTest::Unit::TestCase
        def test_ez_value
                r = StatHat::API.ez_post_value("test ez value stat", "patrick@stathat.com", 0.92)
                assert(r.valid?, "response was invalid")
                assert_equal(r.msg, "ok", "message should be 'ok'")
                assert_equal(r.status, 200, "status should be 200")
        end

        def test_ez_count
                r = StatHat::API.ez_post_value("test ez count stat", "patrick@stathat.com", 12)
                assert(r.valid?, "response was invalid")
                assert_equal(r.msg, "ok", "message should be 'ok'")
                assert_equal(r.status, 200, "status should be 200")
        end

        def test_classic_count_bad_keys
                r = StatHat::API.post_count("XXXXXXXX", "YYYYYYYY", 12)
                assert_equal(r.valid?, false, "response was valid")
                assert_equal(r.msg, "invalid keys", "incorrect error message")
                assert_equal(r.status, 500, "incorrect status code")
        end

        def test_classic_value_bad_keys
                r = StatHat::API.post_value("ZZZZZZZZ", "YYYYYYYYY", 0.92)
                assert_equal(r.valid?, false, "response was valid")
                assert_equal(r.msg, "invalid keys", "incorrect error message")
                assert_equal(r.status, 500, "incorrect status code")
        end
end
