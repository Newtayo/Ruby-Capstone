require_relative 'menu/list'
require_relative 'menu/select'
require_relative 'app'

class Main
  def start
    puts 'welcome'
    menu_list
    select = Select.new
    loop do
      puts 'Please have an option from above with any number (1-7):::'
      opt = gets.chomp
      app = App.new
      select.select_option(opt, app)
    end
  end
end

main = Main.new
main.start
