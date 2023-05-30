require_relative 'menu/list'
require_relative 'menu/select'

class Main
  def start
    puts 'welcome'
    menu_list
    select = Select.new
    loop do
      puts "Please have an option from above with any number (1-7):::"
      opt = gets.chomp.to_i
      select.opt_select(opt)
    end
  end
end

main = Main.new
main.start
