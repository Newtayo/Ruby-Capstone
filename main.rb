require_relative 'menu/list'
require_relative 'menu/select'
require_relative 'app'

class Main
  def start
    puts 'Welcome'
    menu_list

    select = Select.new
    app = App.new

    app.load_data # Load data when opening the program

    loop do
      puts 'Please enter an option from the menu (1-7):'
      opt = gets.chomp
      select.select_option(opt, app)
    ensure
      app.save_data # Save data when closing the program
    end
  end
end

main = Main.new
main.start
