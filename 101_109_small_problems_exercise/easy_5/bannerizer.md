### Further Exploration
The working solution here wraps the text string and fit it appropriately into an 80-column terminal window. To correctly render an input text that contain multiple paragraphs, we also consider this edge case where it contains one or more newline `\n` characters.

## Breaking Down Into Parts:

```ruby
MAX_WIDTH = 76
```
First, we specify the constant variable `MAX_WIDTH`. This will be the maximum character width of the text string at any given line. We set this to be 76 (total box width of 80 minus 2 characters of padding on each side)

We then create our main method `print_in_box` that takes in a text input as an argument. The text input can be a simple line of string or multiple paragraphs. We then initialize a method local variable `content_width` to determine the width of our box:

```ruby
def print_in_box(input_string)
  content_width = [input_string.size, MAX_WIDTH].min
end
```
The `content_width` resizes based on the character size of the input string, up to a width of 76 characters. 

## Wrapping the Input Text
Before moving on to draw the box and output the string, we need to split the input text into multiple paragraphs, and subsequently into individual lines before formatting them into a wrapped-string output. We create a sub-method `wrapped_output` that aims to return a wrapped, formatted text string before we call `puts` in our main method `print_in_box`:

```ruby
def wrapped_output(input_string, content_width)
  paragraphs = input_string.split("\n")
end
```
Next, we create an array `paragraphs` that contains each paragraph as elements. We can do this by calling `String#split` on the input text with `\n` as the delimiter.


```ruby
'Sample first paragraph.

Sample second paragraph...'.split("\n")
# => ["Sample first paragraph.", "", "Sample second paragraph..."]
```
