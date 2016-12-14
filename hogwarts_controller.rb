require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./models/student')
require_relative('./models/house')

get '/' do
  erb(:index)
end

get'/show_students' do
  @students = Student.all()
  @houses = House.all()
  erb(:show_students)
end
