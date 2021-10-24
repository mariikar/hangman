# 1. Поздороваться
# 2. Загрузить случайное слово из файла
# 3. Пока не закончилась игра
  #  3.1 Вывести очередное состояние игры
  #  3.2 Спросить очередную букву
  #  3.3 Обновить состояние игры
# 4. Вывести финальное состояние игры

require_relative "lib/consoleinterface"
require_relative "lib/game"

puts "Всем привет!"

word = File.readlines(__dir__+'/data/words.txt').sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

until game.over?
 console_interface.print_out
 letter = console_interface.get_input
 game.play!(letter)
end

console_interface.print_out
