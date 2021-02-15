class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id  

    def initialize(id=nil, name=nil, type=nil, db=nil)
        @id = id 
        @name = name
        @type = type
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * 
            FROM pokemon
            WHERE id = ?;
        SQL

        
        db.execute(sql, id).map {|row| Pokemon.new(row[0], row[1], row[2])}.first
    end
end
