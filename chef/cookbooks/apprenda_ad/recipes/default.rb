#
# Cookbook:: apprenda_ad
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

windows_ad_domain "apprenda.bxcr" do
action :create
type "forest"
safe_mode_pass "password@123"
domain_user "adadmin"
domain_pass "password@123"
end

#restart after
reboot 'now' do
action :request_reboot
reason 'Cannot continue Chef run without a reboot.'
end