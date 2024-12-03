require 'json'

def hash_to_json
  my_hash = { name: "Vasyl", age: 71, city: "Kharkiv" }

  # Перетворення хешу у відформатований JSON
  json_string = JSON.pretty_generate(my_hash)

  # Виведення відформатованого JSON
  puts "Відформатований JSON:"
  puts json_string

  # Запис у файл
  File.open("output.json", "w") do |file|
    file.write(json_string)
  end
  puts "Відформатований JSON записано у файл output.json"
end

def json_to_hash
  # Читання JSON з файлу
  if File.exist?("output.json")
    json_string = File.read("output.json")

    # Перетворення JSON назад у хеш
    parsed_hash = JSON.parse(json_string)

    # Виведення хешу
    puts "Перетворений хеш з JSON:"
    puts parsed_hash
  else
    puts "Файл output.json не знайдений."
  end
end

def menu
  loop do
    puts "Меню:"
    puts "1. Перетворити хеш у JSON"
    puts "2. Перетворити JSON з файлу у хеш"
    puts "3. Вихід"
    print "Оберіть опцію: "
    choice = gets.chomp.to_i

    case choice
    when 1
      hash_to_json
    when 2
      json_to_hash
    when 3
      puts "До побачення!"
      break
    else
      puts "Невірний вибір, спробуйте ще раз."
    end
  end
end

# Виклик меню
menu
