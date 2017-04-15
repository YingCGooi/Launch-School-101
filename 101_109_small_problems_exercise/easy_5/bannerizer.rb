# Write a method that will take a short line of text, and print it within a box.
MAX_WIDTH = 76
def wrapped_output(input_string, content_width)
  paragraphs = input_string.split("\n")

  paragraphs.map do |paragraph|
    formatted_text = ''
    number_of_lines = (paragraph.size / MAX_WIDTH) + 1

    for i in (1..number_of_lines)
      current_line = paragraph[MAX_WIDTH * (i - 1), MAX_WIDTH]
      formatted_text += "| " + current_line.ljust(content_width) + " |\n"
    end

    formatted_text
  end
end

def print_in_box(input_string)

  content_width = [input_string.size, MAX_WIDTH].min
  horizontal_rule = "+-#{'-' * content_width}-+"
  top_bottom_padding = "| #{' ' * content_width} |"

  puts horizontal_rule
  puts top_bottom_padding
  puts wrapped_output(input_string, content_width)
  puts top_bottom_padding
  puts horizontal_rule
end

print_in_box('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate vestibulum nisi. Nam maximus hendrerit eros non mattis. Fusce a pretium elit. Nulla ullamcorper turpis orci, eu accumsan tellus euismod suscipit. Pellentesque convallis dolor dolor.

Nam vitae lectus mauris. Duis posuere quis massa quis auctor. Phasellus porta fermentum lacus ac convallis. Nam id orci sit amet metus ornare sodales quis ac dolor.

Donec auctor commodo ligula, id luctus ligula egestas at. Donec euismod ut tellus non scelerisque. Nulla ut elit leo. Aliquam molestie in tortor ac congue. Fusce eget blandit velit.')

print_in_box('To boldly go where no one has gone before.')

print_in_box('')
