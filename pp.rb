class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end


ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]


def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
  puts ""
end

#array_printer(array_of_languages)

new_array = array_of_languages.map do |language|
	language.age += 1
	language
end
#array_printer(new_array)

array_sort_by_age = array_of_languages.sort do |a, b|
	b.age <=> a.age
end

#array_printer(array_age)

arr_deleted = array_of_languages.delete_if do |language|
	language.name == 'Java'
end
#array_printer(arr_deleted)

array_shuffled = array_sort_by_age.shuffle

puts "=============="
#array_printer(array_shuffled)

#Elimina el ultimo objeto del array y devuelve el objeto
array_pop = array_of_languages.pop
#array_printer(array_of_languages)

#Todos los elementos que sean true en el body, los quita del array
array_reject = array_of_languages.reject do |language|
	language.age.odd?
end

#array_printer(array_of_languages)
#array_printer(array_reject)

#Mueve todos lo elementos del array a la izquierda una posicion
array_rotated = array_reject.rotate
#array_printer(array_rotated)

array_of_languages.map! { | language | language.name + "!!!"}
#puts array_of_languages
