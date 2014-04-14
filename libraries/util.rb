require 'json'

class Chef::Recipe::EC2Util
  
  def self.get_instance_id
    (`curl -s http://169.254.169.254/latest/meta-data/instance-id`).strip rescue ""
  end
  
  def self.get_instance_az
    (`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`).strip rescue ""
  end
  
  def self.get_instance_region
    JSON.parse((`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document`).strip)["region"] rescue ""
  end
  
end
