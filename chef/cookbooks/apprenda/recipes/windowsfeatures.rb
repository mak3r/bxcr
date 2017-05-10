include_recipe "windows"

windows_feature "IIS-ManagementConsole" do
    action :install
end
windows_feature "IIS-NetFxExtensibility45" do
    action :install
end
windows_feature "IIS-ASPNET45" do
    action :install
end
windows_feature "IIS-ISAPIExtensions" do
    action :install
end
windows_feature "IIS-ISAPIFilter" do
    action :install
end
windows_feature "IIS-WebSockets" do
    action :install
end
windows_feature "IIS-CommonHttpFeatures" do
    action :install
end
windows_feature "IIS-HttpLogging" do
    action :install
end
windows_feature "IIS-HttpCompressionStatic" do
    action :install
end
windows_feature "IIS-RequestFiltering" do
    action :install
end
windows_feature "Windows-Identity-Foundation" do
    action :install
end
