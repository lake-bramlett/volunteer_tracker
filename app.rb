
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
  @project = Project.find(params[:id])
  @volunteers = Volunteer.all
  @current_volunteers = @project.volunteers
  erb(:project)
end

get ('/projects/:id/edit_project') do
  @project = Project.find(params[:id])
  erb(:edit_project)
end

get ('/projects/most_to_least') do
  @projects = Project.most_to_least
  @volunteers = Volunteer.all
  erb(:index)
end


get ('/volunteer/:id') do
  @volunteer = Volunteer.find(params[:id])
  erb(:volunteer)
end

get ('/volunteers') do
  @name = params[:search]
  @results = Volunteer.search_by_name(@name)
  erb(:results)
end

post ('/projects') do
  project = Project.new(:title => params[:title], :total_hours => 0, :id => nil)
  project.save
  redirect to('/')
end

post ('/volunteer') do
  project = Volunteer.new(:name => params[:name], :project_id => 0, :hours => 0, :id => nil)
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

patch ('/projects/:project_id/:volunteer_id/hours') do
  binding.pry
  @volunteer = Volunteer.find(params[:volunteer_id])
  @volunteer.log_hours(params[:hours], params[:project_id])
  redirect to("/projects/#{params[:project_id]}")
end

delete ('/projects/:id/delete') do
  @project = Project.find(:id)
  @project.delete
  redirect to('/')
end

delete ('/volunteers/:id/delete') do
  @volunteer = Volunteer.find(params[:id])
  @volunteer.delete
  redirect to('/')
end
