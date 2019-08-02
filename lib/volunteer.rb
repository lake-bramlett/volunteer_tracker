class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id).to_i
    @id = attributes.fetch(:id)
  end

  def self.all
    returned = DB.exec("SELECT * FROM volunteers ORDER BY name;")
    volunteers = []
    returned.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(thing_to_compare)
    self.name == thing_to_compare.name
  end

end
