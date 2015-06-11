# Cookbook Name: Infoblox
# Recipe Name: remove_reserve_ip

include_recipe 'infoblox::default'

infoblox_vm 'Power Off a VM' do
  user node['vcenter']['username']
  password node['vcenter']['password']
  host node['vcenter']['vcenter_host']
  pubkey_hash node['vcenter']['pubkey_hash']
  force node['vcenter']['force']
  name node['remove_reserve_ip']['vm_name']
  action :power_off
end

infoblox_vm 'Deprovision a VM' do
  user node['vcenter']['username']
  password node['vcenter']['password']
  host node['vcenter']['vcenter_host']
  pubkey_hash node['vcenter']['pubkey_hash']
  name node['remove_reserve_ip']['vm_name']
  action :deprovision
end

infoblox_ip_address "Remove reserved IP" do
  name node['remove_reserve_ip']['hostname']
  ipv4addr node['remove_reserve_ip']['ipv4addr']
  record_type node['remove_reserve_ip']['record_type']
  ptrdname node['remove_reserve_ip']['ptrdname']
  canonical node['remove_reserve_ip']['canonical']
  action :remove
end