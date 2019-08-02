
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

get ('/new_project') do
  erb(:new_project)
end

get ('/new_volunteer') do
  erb(:new_volunteer)
end

get ('/projects/:id') do
  @project = Project.find(:id)
  @volunteers = Volunteer.all
  @current_volunteers = @project.volunteers
  erb(:project)
end

post ('/projects') do
  project = Project.new(:title => params[:title], :id => nil)
  project.save
  redirect to('/')
end

post ('/volunteer') do
  project = Volunteer.new(:name => params[:name], :project_id => 0, :id => nil)
  project.save
  redirect to('/')
end

patch ('/projects/:project_id/assign/:volunteer_id') do
   project = params[:project_id].to_i()
   @project = Project.find(project)
   @project.assign(params[:volunteer_id].to_i)
   @project.volunteers
   redirect to("/projects/#{project}")
 end

 patch ('/projects/:project_id/unassign/:volunteer_id') do
    project = params[:project_id].to_i()
    @project = Project.find(project)
    @project.unassign(params[:volunteer_id].to_i)
    @project.volunteers
    redirect to("/projects/#{project}")
  end
