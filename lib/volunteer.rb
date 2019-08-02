class Volunteer
  attr_accessor :name, :project_id, :hours
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id).to_i
    @hours = attributes.fetch(:hours).to_i
    @id = attributes.fetch(:id)
  end

  def self.all
    returned = DB.exec("SELECT * FROM volunteers ORDER BY name;")
    volunteers = []
    returned.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      hours = volunteer.fetch("hours").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id, :hours => hours}))
    end
    volunteers
  end

  def self.search_by_name(name)
    returned = DB.exec("SELECT * FROM volunteers WHERE lower(name) = '#{name.downcase}'")
    volunteers = []
    returned.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      hours = volunteer.fetch("hours").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id, :hours => hours}))
    end
    volunteers
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      hours = volunteer.fetch("hours").to_i
      id = volunteer.fetch("id").to_i
      Volunteer.new({:id => id, :name => name, :project_id => project_id, :hours => hours})
    else
      nil
    end
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id, hours) VALUES ('#{@name}', #{@project_id}, #{@hours}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(thing_to_compare)
    self.name == thing_to_compare.name
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end
end
