# no symbols fica o mesmo object_id enquanto na string não
puts "Maria".object_id
puts "Maria".object_id
puts "Maria".object_id
puts "Maria".object_id
puts "================"
puts :maria.object_id
puts :maria.object_id
puts :maria.object_id
puts :maria.object_id

#no hash

# tradicional
h = {:curso => "rails"}

# nova
h = {curso: "rails"}