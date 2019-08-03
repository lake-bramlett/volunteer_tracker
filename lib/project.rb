class Project
  attr_accessor :title, :total_hours
  attr_reader :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @total_hours = attributes.fetch(:total_hours).to_i
    @id = attributes.fetch(:id)
  end

  def self.all
    returned = DB.exec("SELECT * FROM projects ORDER BY title;")
    projects = []
    returned.each() do |project|
      title = project.fetch("title")
      total_hours = project.fetch("total_hours").to_i
      id = project.fetch("id").to_i
      projects.push(Project.new({:id => id, :title => title, :total_hours => total_hours}))
    end
    projects
  end

  def self.most_to_least
    returned = DB.exec("SELECT * FROM projects ORDER BY total_hours DESC;")
    projects = []
    returned.each() do |project|
      title = project.fetch("title")
      total_hours = project.fetch("total_hours").to_i
      id = project.fetch("id").to_i
      projects.push(Project.new({:id => id, :title => title, :total_hours => total_hours}))
    end
    projects
  end

  def self.least_to_most
    returned = DB.exec("SELECT * FROM projects ORDER BY total_hours ASC;")
    projects = []
    returned.each() do |project|
      title = project.fetch("title")
      total_hours = project.fetch("total_hours").to_i
      id = project.fetch("id").to_i
      projects.push(Project.new({:id => id, :title => title, :total_hours => total_hours}))
    end
    projects
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch("title")
      total_hours = project.fetch("total_hours").to_i
      id = project.fetch("id").to_i
      Project.new({:id => id, :title => title, :total_hours => total_hours})
    else
      nil
    end
  end

  def save
    result = DB.exec("INSERT INTO projects (title, total_hours) VALUES ('#{@title}', #{@total_hours}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(thing_to_compare)
    self.title == thing_to_compare.title
  end

  def volunteers
    returned = DB.exec("SELECT * FROM volunteers where project_id = #{self.id}")
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

  def assign(volunteer_id)
    DB.exec("UPDATE volunteers SET project_id = (#{self.id}) WHERE id = (#{volunteer_id})")
  end

  def unassign(volunteer_id)
    DB.exec("UPDATE volunteers SET project_id = (0) WHERE id = (#{volunteer_id})")
  end

  def update(attributes)
    (attributes.key? :title) ? @title = attributes.fetch(:title) : @title = @title
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("UPDATE volunteers SET project_id = (0) WHERE project_id = #{@id}")
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

end
