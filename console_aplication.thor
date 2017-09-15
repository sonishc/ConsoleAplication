require 'thor'
# Cli
class Cli < Thor
  system('clear')

  desc 'set_list', 'This function autoset tasks'
  def set_list
    obj = Tasks.tasks
    keys_tasks = [] # All methods name
    tmp_tasks = []
    obj.each_key { |key| keys_tasks << key }
    obj.each_value { |value| tmp_tasks << value }
    value_task = []
    tmp_tasks.each do |v|
      k = /n=\"(.*)\", l/i.match(v.to_s)
      value_task << k[1]
    end
    say("[ Welcome to the RubyMathTasks ] \n\n", color = "\e[36m" )
    i = 0
    value_task.map { |task| puts "       #{i += 1} <-- #{task}" }
    puts ' '
  end

  desc 'call_tasks', 'Get num in list'
  def call_tasks
    obj = Tasks.new
    name_task = Tasks.tasks
    keys_tasks = []
    name_task.each_key { |key| keys_tasks << key }
    n = ask("Input number of program to USE it?\n" \
        'Or press ENTER to exit', color = "\e[32m")

    test = (1..keys_tasks.length).to_a
    i = 0
    while i < keys_tasks.length
      case n.upcase
      when test[i].to_s
        system('clear')
        puts obj.send(keys_tasks[i])
      end
      i += 1
    end
  end
  desc 'set_method', 'Get num in list'
  def set_methods
    set_list
    call_tasks

    back_command = lambda do
      back = ask("\nBack to list program press -B ENTER " \
            "or input -Q press ENTER to exit\n", color = "\e[1m").upcase
      if back == '-B'
        system('clear')
        return set_methods
      elsif back == '-Q'
        system('quit')
      else
        system('clear')
        say("input correct number \n", color = "\e[31m")
        back_command.call
      end
    end
    back_command.call
  end

end
