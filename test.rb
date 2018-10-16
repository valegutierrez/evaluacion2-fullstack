file = File.open('students.csv', 'r')
print file.readlines.map(&:chomp)
file.close
puts 'Ingresa una opción de 1 a 4'
puts '1: Mostrar datos de alumnos'
puts '2: Cantidad de asistencias totales'
puts '3: Estudiantes aprobados'
puts '4: Salir'
options = gets.chomp
# while options != 4
#     case 1:
#     case 2:
#     case 3:
# end