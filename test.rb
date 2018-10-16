file = File.open('students.csv', 'r')
students = file.readlines
file.close
options = 0
while options != 4
  puts 'Ingresa una opción de 1 a 4'
  puts '1: Mostrar promedios de alumnos'
  puts '2: Cantidad de asistencias totales'
  puts '3: Estudiantes aprobados'
  puts '4: Salir'
  options = gets.chomp.to_i
  case options
    when 1
      puts 'Promedios:'
      students.each do |student|
        data = student.split(', ').map(&:chomp)
        grades = data[1..5].inject { |acc, sum| acc.to_i + sum.to_i }
        average = grades / 5
        hash = { data[0] => average }
        puts hash
      end
    when 2
    when 3
  end
end
