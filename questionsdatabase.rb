require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    attr_accessor :id, :fname, :lname

     def find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM 
          users
        WHERE
          id = ?
        SQL
        Users.new(user.first)
     end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| Users.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
    end
    
    def create
        raise "#{self} is already in the database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
          INSERT INTO
            users (fname, lname)
          VALUES
           (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
        UPDATE
            users
        SET
            fname = ?, lname = ?
        WHERE
            id = ?
            SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end
    
end

class Questions
    attr_accessor :id, :title, :body

    def find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM 
          questions
        WHERE
          id = ?
        SQL
        Questions.new(question.first)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| Users.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
    end
    
    def create
        raise "#{self} is already in the database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
            INSERT INTO
                questions (title, body)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
        UPDATE
            questions
        SET
            title = ?, body = ?
        WHERE
            id = ?
            SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end
end

class Question_Follows
     def find_by_id
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM 
          question_follows
        WHERE
          id = ?
        SQL
        Question_Follows.new(question_folows.first)

      def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions_follows")
        data.map { |datum| Users.new(datum)}
    end

    def initialize(options)
        @id = options['id']
    end
    
    def create
        raise "#{self} is already in the database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, users.users_id, questions.questions_id)
            INSERT INTO
                question_follows (users_id, questions_id)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
        UPDATE
            questions
        SET
            title = ?, body = ?
        WHERE
            id = ?
            SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end
end

class Question_Likes
     def find_by_id
        question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM 
          question_likes
        WHERE
          id = ?
        SQL
        Question_Likes.new(question_likes.first)
    end

    def create
      raise "#{self} is already in the database" if self.id
      QuestionsDatabase.instance.execute(<<-SQL, self.users_id, self.questions_id)
          INSERT INTO
              question_likes (title, body)
          VALUES
              (?, ?)
      SQL
      self.id = QuestionsDatabase.instance.last_insert_row_id
    end
end

class Replies
     def find_by_id
        
    end

    def initialize(options)
        @id = options['id']
    end
    
    def create
        raise "#{self} is already in the database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, users.users_id, questions.questions_id)
            INSERT INTO
                question_follows (users_id, questions_id)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
        UPDATE
            questions
        SET
            title = ?, body = ?
        WHERE
            id = ?
            SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end
end