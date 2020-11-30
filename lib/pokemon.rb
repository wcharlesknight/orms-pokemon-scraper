

class Pokemon 

    attr_accessor :type, :db, :id, :name
    
    def initialize(id:, name:, type:, db:)
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
            SQL
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 

    def self.find(id, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?        
        SQL
        #binding.pry
        result = db.execute(sql, id)[0]
        n = Pokemon.new(id: result[0],name: result[1],type: result[2],db: result[3])
        n.id = result[0]
        n.name = result[1] 
        n.type = result[2]
        n.db = result[3]
        n 
    end
    
end
