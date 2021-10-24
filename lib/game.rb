# Хранит загаданное слово, кольок букв отгадано и какие
# Сколько было ошибок, смотрит есть ли названная буква
class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def errors
    @user_guesses - @letters
  end

  def letters_to_guess
    result =
    @letters.map do |letter|
      if @user_guesses.include?(letter)
        letter
      else
        nil
      end
    end
   result
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(letter)
      @user_guesses << letter
    end
  end

  def won?
    (@letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end
end
