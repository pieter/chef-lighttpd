cookbook_file "/usr/share/lighttpd/include-sites-enabled.pl" do
  source "include-sites-enabled.pl"
  mode 0755
  owner "root"
  group "root"
end

cookbook_file "/etc/lighttpd/conf-available/30-sites.conf" do
  source "30-sites.conf"
  mode 0644
  owner "root"
  group "root"
end

# make sites-available and sites-enabled
directory "/etc/lighttpd/sites-available" do
  action :create
  mode 0755
  owner "root"
  group "root"
end

directory "/etc/lighttpd/sites-enabled" do
  action :create
  mode 0755
  owner "root"
  group "root"
end

lighttpd_module 'sites'
