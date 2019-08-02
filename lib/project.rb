class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned = DB.exec("SELECT * FROM projects ORDER BY title;")
    projects = []
    returned.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:id => id, :title => title}))
    end
    projects
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch("title")
      id = project.fetch("id").to_i
      Project.new({:id => id, :title => title})
    else
      nil
    end
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
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
     id = volunteer.fetch("id").to_i
     volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
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
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

end
