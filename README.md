rails new demo

rails server start

rails generate controller Todo index add create delete

=========

rails generate model Todo todo_item:string        > bikin migration /schema tabel
rails destroy model Todo

rake db:migrate -> push data ke database asli.

rake db:rollback -> balikin ke posisi sebelum di migrate.


==========

rails console.

Todo.connection
Todo                -> cek tabel 
Todo.all            -> select * from todos




t= Todo.new
t.todo_item ="cuci piring"
t.todo_item = "cuci baju"            -> cara insert pertama tp harus disave
t.save

t.valid?          -> cek valid



Todo.create(:todo_item =>  "bayar internet" )                  -> cara insert kedua lbh cepet
Todo.create(todo_item: "kejar setoran")



Todo.first
Todo.last
Todo.find(1)
Todo.find_by_todo_item("bayar")


t= Todo.first, t.delete
Todo.delete_all


id:integer
todo_item: string
created_at:datetime
updated_at: datetime



==========


<%= link_to 'this is a link', '/todos/index' %>





match "todos/index" => "todos#index", via: [:get, :post] , :as => :index           ->    index_path

bisa pake redirect_to index_path



==========

attr_accessible :todo_item
validates :todo_item, presence: true           -> validasi model



=========

# creating migration

rails generate migration AddCompletedToTodo

db/migrate/[timestamp]_add_completed_to_todo.rb  ->  lokasi migrationnya.   


insert add_column :todos, :completed, :boolean   -> masukin ke tabel todos,  field completed tipenya boolean.


app/models/todo.rb   ->  masukin ke model todo.  attr_accesible :todo_item, :completed           -> adding read permission ke field completed



==========

t.update_attribute(:completed,true)      -> cara updatenya


t = Todo.find_by_id(todo_id)
t.update_attribute(:completed, true)





=========

rake db:drop         -> hapus smua database
rake db:migrate      -> apply ulang migration

