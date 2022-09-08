require_relative '../modules/file_handle'
require_relative '../models/label'

class LabelController
  attr_reader :labels

  def initialize()
    @labels = []
    @file_name = 'labels.json'
  end

  def select_label
    puts "\nSelect 1 to add new label: "
    puts "\nSelect 2 to list all labels:"
    choice = gets.chomp.to_i
    unless (1..2).include?(choice)
      puts "\nInvalid choice #{choice}! Try again"
      return select_label
    end

    list_all_labels if choice == 2

    add_label if choice == 1
  end

  def add_label
    list_all_labels
    print "\nEnter the title of New Label: "
    title = gets.chomp
    print 'Enter the color of New Label: '
    color = gets.chomp
    new_label = Label.new(title, color)
    @labels << new_label
    puts 'Label added successfully!'
  end

  def list_all_labels
    puts "\nAvailable labels are:"
    print "\n"
    @labels.each.with_index(1) do |label, index|
      puts "#{index}) #{label.title} | #{label.color}"
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
