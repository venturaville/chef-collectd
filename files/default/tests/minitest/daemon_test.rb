describe_recipe 'collectd::default' do
  describe "services" do
    it "collectd runs as a daemon" do
      service("collectd").must_be_running
    end
  end
end
