require_relative('../db/sql_runner')

class House

  attr_reader( :name, :logo, :id)

  def initialize( options )
    @id = options['id'].to_i || nil
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "
      INSERT INTO houses (name, logo) VALUES ('#{@name}', '#{@logo}') RETURNING *;
    "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all()
    sql = "
      SELECT * FROM houses;
    "
    all_houses = SqlRunner.run(sql).map { |house| House.new(house) }
    return all_houses
  end

  def self.find_by_id(id)
    sql = "
      SELECT * FROM houses
      WHERE id = #{id};
    "
    house = SqlRunner.run(sql)[0]
    return house
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

end