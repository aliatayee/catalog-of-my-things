require_relative '../modules/file_handle'
require_relative '../models/label'

class LabelController
  attr_reader :labels

  def initialize()
    @labels = []
    @file_name = 'labels.json'
  end

  def select_label
    puts "\nSelect a Label by number: "
    list_all_labels(show_index: true)
    puts "#{@labels.length + 1}) Add a label"
    print "\nYour choice: "
    choice = gets.chomp.to_i
    if choice.zero? || choice > @labels.length + 1
      puts 'Invalid choice! Try again'
      return select_label
    end
    return add_label if choice == @labels.length + 1

    @labels[choice - 1]
  end

  def add_label
    print 'Enter the title of Label: '
    title = gets.chomp
    print 'Enter the color of Label: '
    color = gets.chomp
    new_label = Label.new(title, color)
    @labels << new_label
    puts 'Label added successfully!'
    new_label
  end

  def list_all_labels(show_index: false)
    index = 1
    @labels.each do |label|
      puts "#{"#{index}) " if show_index}#{label.title} | #{label.color}"
      index += 1
    end
  end

  def save_labels
    label_object = @labels.map do |label|
      { id: label.id, title: label.title, color: label.color }
    end
    HandleFiles.write(@file_name, label_object)
  end

  def load_labels
    data = HandleFiles.read(@file_name)
    data.each do |label|
      new_label = Label.new(label['title'], label['color'], id: label['id'])
      @labels << new_label
    end
  end
end
