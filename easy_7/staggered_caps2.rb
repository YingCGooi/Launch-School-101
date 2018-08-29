# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.


# def staggered_case(string)
#   staggered_str = ''
#   need_upper = true
#   string.each_char.map do |char|
#     if char =~ /[A-z]/ && need_upper
#       need_upper = !need_upper
#       char.upcase
#     elsif char =~ /[A-z]/
#       need_upper = !need_upper
#       char.downcase
#     else
#       char
#     end
#   end .join
# end

def staggered_case(str, count_non_alpha = false)
  need_up = false
  str.chars.map do |char|
    next char if char =~ /[^A-z]/ && !count_non_alpha
    need_up = !need_up # toggle
    need_up ? char.upcase : char.downcase
  end .join
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS')
p staggered_case('ignore 77 the 444 numbers')

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'