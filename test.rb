# File manipulation:
file = File.open('students.csv', 'r')
info = file.readlines
students = []
info.each do |student|
  data_split = student.split(', ').map(&:chomp)
  students.push(data_split)
end
# End of File manipulation

# Methods:
# Consigue los promedios de los alumnos
def get_averages(people)
  arr = []
  people.each do |student|
    grades = student[1..5].inject { |acc, sum| acc.to_i + sum.to_i }
    average = grades / 5
    hash = { name: student[0], average: average }
    arr.push(hash)
  end
  write_averages(arr)
end

# Escribe los promedios y lee el archivo que se genera con los promedios
def write_averages(arr)
  newfile = File.open('studentsaverage.csv', 'w')
  arr.each do |h|
    newfile.puts "#{h[:name]}, #{h[:average]}"
  end
  newfile.close
  average_file = File.open('studentsaverage.csv', 'r')
  puts 'Nombre, Promedio'
  puts average_file.readlines
  average_file.close
end

# Calcula la cantidad de inasistencias
def count_noattendance(people)
  absent_count = people.flatten.count('A')
  puts "La cantidad de inasistencias es #{absent_count}"
end

# Verifica si un estudiante aprobó o no
def approved_student?(num)
  average_file = File.open('studentsaverage.csv', 'r')
  data = average_file.readlines.map(&:chomp)
  arr = []
  data.each do |i|
    separate = i.split(', ')
    arr.push(separate)
  end
  hash = arr.to_h
  hash.each do |k, v|
    puts "#{k} aprobó con promedio #{v.to_i}" if v.to_i >= num
    puts "#{k} no aprobó con promedio #{v.to_i}" if v.to_i < num
  end
end
# End of Methods

# Menu
options = 0
while options != 4
  puts 'Ingresa una opción de 1 a 4'
  puts '1: Mostrar promedios de alumnos'
  puts '2: Cantidad de inasistencias totales'
  puts '3: Estudiantes aprobados'
  puts '4: Salir'
  options = gets.chomp.to_i
  case options
    when 1
      get_averages(students)
    when 2
      count_noattendance(students)
    when 3
      approved_student?(5)
    when 4
      exit
    else
      puts 'Opción inválida'
  end
end
average_file.close
file.close
# End of Menu
