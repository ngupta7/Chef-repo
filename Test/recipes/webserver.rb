package "this is arbitary" do
  action :install
  case node[:platform_family]
      when 'rhel'
         package_name "httpd"
      when 'debian'
         package_name "apache2"
   end
end

service "apache2" do
 action [:start,:enable]
 case [:platform_family]
  when 'rhel'
   service_name "httpd2"
  when 'debian'
   service_name "apache2"
  end

end

file '/var/www/html/index.html' do
 content '<html>This is a new file created </html>'
 mode '0755'
 owner 'root'
 group 'root'
end

template "/var/www/html/new.html" do
  source "new.html.erb"
  action :create
  variables ({
     :companyName => "My company",
     :productlist => ["course1","course2"],
     :premium => true
   })
 end

cookbook_file "/var/www/html/web.html" do
 source "web.html"
end 
 

