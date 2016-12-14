require_relative('../db/sql_runner')

class Student

  attr_accessor ( :house_id )
  attr_reader( :first_name, :last_name, :age, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name , last_name, age , house_id) VALUES ('#{@first_name}' , '#{@last_name}', #{@age}, #{@house_id}) returning *; "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students;"
    all_students = SqlRunner.run(sql).map { |student| Student.new(student) }
    return all_students
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = #{@id};"
    student = SqlRunner.run(sql)[0]
    return student
  end

  def self.house(id)
    sql = "SELECT house FROM students WHERE id = #{@id};"
    house = SqlRunner.run(sql)[0]
    return house
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

end