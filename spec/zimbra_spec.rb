require 'spec_helper'

describe "Zimbra audit grok pattern" do

  before do
    @grok = Grok.new
    @grok.add_patterns_from_file("grok.d/base")
    @grok.add_patterns_from_file("grok.d/zimbra_patterns")
    @grok.compile('%{ZIMBRAAUDIT}')
  end

describe "with a soap protocol audit zimbra log line without error" do
    before do
      log_line = '2015-12-05 18:47:36,435 INFO  [qtp1545357780-7135140:http://127.0.0.1:80/service/soap/AuthRequest] [name=pepe@domain.com;oip=10.1.2.123;ua=zclient/2.0.5_GA_1839;] security - cmd=Auth; account=pepe@domain.com; protocol=soap;'
      @match = @grok.match(log_line)
    end

    it "should have the correct datetime value" do
      @match.should have_logstash_field("logdate").with_value("2015-12-05 18:47:36,435")
    end
  end
end