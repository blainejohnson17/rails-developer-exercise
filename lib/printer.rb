class Printer
  def self.call
    Project.all.map(&:attributes).to_yaml
  end
end