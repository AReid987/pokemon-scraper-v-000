class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []
  def initialize(id = nil, name = nil, type = nil, hp = 60, db = nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    #ins = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(id, db)
    query_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id;").flatten
    new_pokemon = Pokemon.new(query_pokemon[0], query_pokemon[1], query_pokemon[2], 60, db)
    #binding.pry
  end

  def alter_hp(new_hp, db)
    #find the object in db
    #@hp = hp
    binding.pry
    db.execute("UPDATE pokemon SET hp = self.hp WHERE id = self.id;")
    #binding.pry
  end
end
