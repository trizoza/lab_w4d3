require_relative ('../models/student')
require_relative ('../models/house')
require ('pry')

Student.delete_all()
House.delete_all()

house1 = House.new( 'name' => 'Gryffindor', 'logo' => 'https://s-media-cache-ak0.pinimg.com/originals/0d/d6/61/0dd661773c911b7de32d29a1184c3fc7.jpg' )
house1.save()

house2 = House.new( 'name' => 'Ravenclaw', 'logo' => 'http://www.needlework.ru/UserFiles/Image/seven_dwarf/ravenclaw_logo_embroidery_design.jpg' )
house2.save()

house3 = House.new( 'name' => 'Hufflepuff', 'logo' => 'http://data.whicdn.com/images/201000257/large.jpg' )
house3.save()

house4 = House.new( 'name' => 'Slytherin', 'logo' => 'http://ii.wbshop.com/fcgi-bin/iipsrv.fcgi?FIF=/images/warnerbros/source/warnerbros/hpmlp116s_2.tif&wid=370&cvt=jpeg' )
house4.save()

student1 = Student.new( 'first_name' => 'Harry', 'last_name' => 'Potter', 'age' => 12, 'house_id' => house2.id )
student1.save()

binding.pry
nil