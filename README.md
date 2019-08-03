# _Volunteer Tracker_

#### _Code Review, 2 August 2019_

#### By _**Lake Bramlett**_

## Description

_'Volunteer Tracker' is an application designed to enter individual projects and volunteers into a database, assign those volunteers to specific projects, and keep record of how many hours each individual volunteers has worked across all projects and how many aggregate hours each project has had worked for it._

## Setup/Installation Requirements

* _Clone https://github.com/lake-bramlett/volunteer_tracker repo locally_
* _In the command line, navigate to the clone repo_
* _Initiate a `bundle install` in the command line_
* _Run `ruby app.rb` in terminal window_
* _Navigate to localhost:4567 in preferred web browser_
* _Use preferred text editor to edit_
* _Make any pull requests to https://github.com/lake-bramlett/volunteer_tracker ._

## Specs
|Spec|Input|Output|
|---- |:---:|----:|
|returns the name of the volunteer | Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil}) | 'Jane' |
|returns the project_id of the volunteer | Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil}) | true |
|checks for equality based on the name of a volunteer | volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil}); volunteer2 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})| true |
|returns all volunteers|volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil});volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})|[volunteer1, volunteer2]|
|adds a volunteer to the database|Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil}|[volunteer1]|
|returns a volunteer by id|volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil}); Volunteer.find(volunteer1.id) |volunteer1 |
|returns the project title|Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil})|'Teaching Kids to Code'|
|returns the id of the project before saving project|Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil})|nil|
|returns the id of the project after saving project|Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil})| An Integer |
|is the same project if two projects have the same title|project1 = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil});project2 = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil})|true|
|is empty to start|Project.all|[]|
|returns all projects|project1 = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil});project2 = Project.new({:title => 'Teaching Ruby to Kids', :total_hours => 0, :id => nil});Project.all|[project1, project2]|
|saves a project to the database|project = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil});Project.all|[project]|
|returns a project by id|project1 = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil});Project.find(project1.id)|project1|
|returns all volunteers for a specific project|project = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil});volunteer1 = Volunteer.new({:name => 'Jasmine', :project_id => project.id, :hours => 0, :id => nil});volunteer2 = Volunteer.new({:name => 'Joe', :project_id => project.id, :hours => 0, :id => nil});project.volunteers|volunteer1, volunteer2]|
|allows a user to update a project|project = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil});project.update({:title => 'Teaching Ruby to Kids', :total_hours => 0, :id => nil})|project.title == 'Teaching Ruby to Kids'|
|allows a user to delete a project|project = Project.new({:title => 'Teaching Kids to Code', :total_hours => 0, :id => nil}); project.delete|Project.all == []|

  ## Known Bugs

  _No observed bugs currently at this time (2 August 2019)._

  ## Support and contact details

  _email: lake.bramlett@gmail.com_

  ## Technologies Used


  * _Ruby_
  * _rspec_
  * _Capybara_
  * _Sinatra_
  * _SQL_
  * _PostgreSQL_
  * _Git_


  ### License

  *This software is licensed under the MIT license.*

  Copyright (c) 2019 **_Lake Bramlett_**
