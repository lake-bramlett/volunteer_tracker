
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

get ('/projects/:id') do
  @project = Project.find(:id)
  erb(:project)
end

post ('/projects') do
  project = Project.new(:title => params[:title], :id => nil)
  project.save
  redirect to('/')
end
