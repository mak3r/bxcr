include_recipe "windows_ad"

# Create user "ad admin" in the Users OU
windows_ad_user "Ad Admin" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "adadmin",
"upn" => "adadmin@apprenda.bxcr",
"fn" => "ad",
"ln" => "admin",
"display" => "Admin, Ad",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "SQL" in the Users OU
windows_ad_user "Sql Service" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "sqlservice",
"upn" => "sqlservice@apprenda.bxcr",
"fn" => "sql",
"ln" => "service",
"display" => "Service, Sql",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "SP admin" in the Users OU
windows_ad_user "SP Admin" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "spadmin",
"upn" => "spadmin@apprenda.bxcr",
"fn" => "sp",
"ln" => "admin",
"display" => "Admin, SP",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "SP farm" in the Users OU
windows_ad_user "SP Farm" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "spfarm",
"upn" => "spfarm@apprenda.bxcr",
"fn" => "sp",
"ln" => "farm",
"display" => "Farm, SP",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "SP service" in the Users OU
windows_ad_user "SP Service" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "spservice",
"upn" => "spservice@apprenda.bxcr",
"fn" => "sp",
"ln" => "service",
"display" => "Service, SP",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "SP crawl" in the Users OU
windows_ad_user "SP Crawl" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "spcrawl",
"upn" => "spcrawl@apprenda.bxcr",
"fn" => "sp",
"ln" => "crawl",
"display" => "Crawl, SP",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "SP apppool" in the Users OU
windows_ad_user "SP AppPool" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "spapppool",
"upn" => "spapppool@apprenda.bxcr",
"fn" => "sp",
"ln" => "apppool",
"display" => "AppPool, SP",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Create user "sql admin" in the Users OU
windows_ad_user "sql admin" do
action :create
domain_name "apprenda.bxcr"
ou "users"
options ({ "samid" => "sqladmin",
"upn" => "sqladmin@apprenda.bxcr",
"fn" => "sql",
"ln" => "admin",
"display" => "admin, sql",
"disabled" => "no",
"pwd" => "password@123"
})
end

# Add sql admin to admin group for RDP and local admin access
windows_ad_group_member 'sql admin' do
action :add
group_name 'Enterprise Admins'
domain_name 'apprenda.bxcr'
user_ou 'Users'
group_ou 'Users'
end

windows_ad_group_member 'ad admin' do
action :add
group_name 'Enterprise Admins'
domain_name 'apprenda.bxcr'
user_ou 'Users'
group_ou 'Users'
end

windows_ad_group_member 'sp admin' do
action :add
group_name 'Enterprise Admins'
domain_name 'apprenda.bxcr'
user_ou 'Users'
group_ou 'Users'
end

windows_ad_group_member 'sp farm' do
action :add
group_name 'Enterprise Admins'
domain_name 'apprenda.bxcr'
user_ou 'Users'
group_ou 'Users'
end