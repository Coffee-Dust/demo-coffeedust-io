class ProjectsConfig

  def self.default_directory
    @@default_directory
  end
  def self.project_instances
    @@project_instances
  end
  def self.project_names
    @@project_names
  end
  

  def initialize
    yield(self)
    @@project_names = self.class.project_instances.collect(&:name)
  end

  def project_instances=(array)
    @@project_instances = array
  end

  def default_directory=(value)
    @@default_directory = ENV["PWD"] + value
  end

end