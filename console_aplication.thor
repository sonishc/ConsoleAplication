require 'thor'

class Counter < Thor
  system('clear')
   
  ############################################

  desc 'set', 'This function autoset tasks'
  def set 
    has = Counter.tasks
    keys_tasks = [] # All methods name
    tmp_values_tasks = []

    has.each_key { |key| keys_tasks << key }
    has.each_value { |value| tmp_values_tasks << value }
    v_task = []

    tmp_values_tasks.each do |v|
      k = /n=\"(.*)\", l/i.match(v.to_s)
      v_task << k[1]
    end
    v_task = v_task[0..-3] # Delete first two el in array
    puts("[ Welcome to the ruby Math tasks ] \n\n")
    i = 0
    v_task.map { |task| puts "       #{i += 1} <-- #{task}" }
    puts ' '
  end

  ############################################

  desc "get_num", "Get num in list main def file"
  def get_num    
    set
    name_task = Counter.tasks
    keys_tasks = []
    name_task.each_key {|key| keys_tasks << key }
    keys_tasks = keys_tasks[0..-3]
    n = ask("Number program what we need to USE?\n" \
        'Or write exit press ENTER', color="\e[32m")
    
    test = (1..keys_tasks.length).to_a
       
      i=0
      while i < keys_tasks.length do
      case n.upcase
      when 'exit'.upcase
        system('clear')
      when test[i].to_s
        system('clear')
        send(keys_tasks[i])
      end
      i += 1
      end
 
  ############################################

      back_command = lambda { 
        back = ask("\nBack to list program press -B ENTER " \
            "or write -Q press ENTER to exit\n", color = "\e[1m")

        if back.upcase == '-b'.upcase
          system('clear')
          return get_num
        elsif back.upcase == '-q'.upcase
          system('quit')
        else
          system('clear')
          say("Write correct number \n", color = "\e[31m")
          back_command.call
        end
      }
      back_command.call
  end

  load File.join('mycounter_file.thor')

end
