include_recipe "webpi"

webpi_product 'ARR' do
    accept_eula true
    action :install
end

webpi_product 'WebFarmFramework' do
    accept_eula true
    action :install
end

webpi_product 'ExternalCache' do
    accept_eula true
    action :install
end

webpi_product 'UrlRewrite2' do
    accept_eula true
    action :install
end
