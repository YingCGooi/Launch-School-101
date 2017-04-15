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
We create an array `paragraphs` within this method. `paragraphs` will contain each paragraph as elements. We can do this by calling `String#split` on the input text with `\n` as the delimiter.

##### To simply demonstrate this:
```ruby
input_string = 'Sample first paragraph.

Sample last paragraph...'
input_string.split("\n")
# => ["Sample first paragraph.", "", "Sample last paragraph..."]
```
By calling `String#split` on a string with two paragraphs, we have 3 elements returned in the array: the first paragraph, an empty string and the last paragraph.

Next, we need to think about transforming each paragraph in `paragraphs` into individual lines of strings. We can achieve this by calling `Array#map` on `paragraphs`:

```ruby
def wrapped_output(input_string, content_width)
  paragraphs = input_string.split("\n")

  paragraphs.map do |paragraph|
    number_of_lines = (paragraph.size / MAX_WIDTH) + 1
    formatted_text = '' # initialize empty string
    # code that perform splitting of paragraphs into individual lines
    formatted_text # return formatted string
  end
end
```
Each paragraph or empty string is passed into the `map` block and in turn assigned to the local variable `paragraph`. One way to transform each `paragraph` into individual lines of strings is to add `\n`s into the `paragraph` string whenever we need a line break. We can put the formatted paragraph into a new variable `formatted_text` before returning it as a block return value.

## Determining Number of Lines
To determine how many lines we have in each `paragraph`, we use the formula `(paragraph.size / MAX_WIDTH) + 1`. This formula determines how many 76-character lines can occur in a single paragraph. It then adds `1` to account for the last line which, in many cases is less than 76 characters. *For example, a 254-character paragraph will have 3 full lines and 1 additional line with spaces at the end.*

## Splitting Paragraphs into Multiple Formatted Lines
This is perhaps the trickiest part of the problem. Essentially we want to perform a line-wrap and adding '|' on each end of each line. In our `Array#map` block we will add a loop specifying `i` as the counter.

```ruby
paragraphs.map do |paragraph|
  formatted_text = ''
  number_of_lines = (paragraph.size / MAX_WIDTH) + 1

  for i in (1..number_of_lines)
    current_line = paragraph[MAX_WIDTH * (i - 1), MAX_WIDTH]
    formatted_text += "| " + current_line.ljust(content_width) + " |\n"
  end

  formatted_text
end
```
The trick here is to extract 76 characters at a time from each `paragraph` to form a full line. We can achieve this by using the formula `paragraph[MAX_WIDTH * (i - 1), MAX_WIDTH]`. 

## Formula Breakdown
The question here is perhaps, how do we start with extracting the first 76 characters of each `paragraph`? And how can we continuously extract the next 76 characters at subsequent iterations?

The easiest approach here is perhaps calling `String#[]` (element reference) on `paragraph`. At the first iteration, the first 76 characters of `paragraph` string is simply `paragraph[0, 76]`, it means that we return `76` characters starting from index `0` (first character) of paragraph. 
An example table below shows how each line is being extracted, based on our example paragraph string that has total character number of 254.
>Example string with 254 characters
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate vestibulum nisi. Nam maximus hendrerit eros non mattis. Fusce a pretium elit. Nulla ullamcorper turpis orci, eu accumsan tellus euismod suscipit. Pellentesque convallis dolor dolor.'

| Line Number/ `i` | Index Number (Start - End) | Formula `paragraph[MAX_WIDTH * (i - 1), MAX_WIDTH]` | `current_line`.size | `current_line`                                                                 |
| :---             | ---:                       | :---                                                | ---                 | ---                                                                            |
| 1                | 0  - 75                    | `paragraph[0, 76]`                                  | 76                  | 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate ves' |
| 2                | 76  - 151                  | `paragraph[76, 76]`                                 | 76                  | 'tibulum nisi. Nam maximus hendrerit eros non mattis. Fusce a pretium elit. N' |
| 3                | 152 - 227                  | `paragraph[152, 76]`                                | 76                  | 'ulla ullamcorper turpis orci, eu accumsan tellus euismod suscipit. Pellentes' |
| 4                | 228 - 253                  | `paragraph[228, 76]`                                | 26                  | 'que convallis dolor dolor.'                                                   |

*Note: MAX_WIDTH = 76*


