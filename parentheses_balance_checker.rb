require 'rspec'
require 'pry'

def balanced_parens?(string_of_parens)
  open_parens_so_far = 0
  close_parens_so_far = 0

  string_of_parens.each_char do |char|
    if close_parens_so_far > open_parens_so_far
      return false
    else
      if char == "("
        open_parens_so_far += 1
      elsif char == ")"
        close_parens_so_far += 1
      end
    end
  end
  open_parens_so_far == close_parens_so_far
end

def is_a_closing_delim?(char)
  [")", "]", "}"].include?(char)
end

def is_an_opening_delim?(char)
  ["(", "[", "{"].include?(char)
end

def closer_for(char)
  closing_mapper = {
                     "(" => ")",
                     "{" => "}",
                     "[" => "]"
                   }
  closing_mapper[char]
end

def balanced_delims?(string_of_delimiters)
  expected_closing_delimiters = []
  string_of_delimiters.each_char do |char|
    if is_a_closing_delim?(char)
      if expected_closing_delimiters.first != char
        return false
      else
        expected_closing_delimiters.shift
      end
    elsif is_an_opening_delim?(char)
      expected_closing_delimiters.unshift(closer_for(char))
    end
  end
  expected_closing_delimiters.empty?
end


describe "#balanced_parens?" do
  it "returns true for a simple string with balanced parentheses" do
    string = "()"

    expect(balanced_parens?(string)).to be true
  end

  it "returns false for a string with equal open and close parentheses in the wrong order" do
    string = ")("

    expect(balanced_parens?(string)).to be false
  end

  it "returns false for a string with a single parenthesis" do
    string1 = "("
    string2 = ")"

    expect(balanced_parens?(string1)).to be false
    expect(balanced_parens?(string2)).to be false
  end

  it "returns true for a nested string with balanced parentheses" do
    string = "((((()))))"

    expect(balanced_parens?(string)).to be true
  end

  it "returns true for a string with multiple sets of balanced parentheses" do
    string1 = "()(())()((()))"
    string2 = "() ( ()() ((())) )"

    expect(balanced_parens?(string1)).to be true
    expect(balanced_parens?(string2)).to be true
  end

  it "returns false for complex strings with unbalanced parentheses" do
    string1 = "((())))(())"
    string2 = "((()))(((())))("

    expect(balanced_parens?(string1)).to be false
    expect(balanced_parens?(string2)).to be false
  end

end

describe "#balanced_delims?" do
  context "without complex nesting" do
    it "returns true when all delimiters are balaned" do
      string1 = "(){}[]"
      string2 = "(()){{}}[[]]"
      string3 = "()"
      string4 = "[]"
      string5 = "{}"

      expect(balanced_delims?(string1)).to be true
      expect(balanced_delims?(string2)).to be true
      expect(balanced_delims?(string3)).to be true
      expect(balanced_delims?(string4)).to be true
      expect(balanced_delims?(string5)).to be true
    end

    it "returns false when there any of the delimiters are not balanced" do
      string1 = "(){[]"
      string2 = "(())){}[[]]"
      string3 = "}"
      string4 = "["

      expect(balanced_delims?(string1)).to be false
      expect(balanced_delims?(string2)).to be false
      expect(balanced_delims?(string3)).to be false
      expect(balanced_delims?(string4)).to be false
    end
  end

  context "with complex nesting" do
    it "returns true when all delimiters are balanced" do
      string1 = "({[]})"
      string2 = "(({[][]}))"
      string3 = "[][]{{[(({{{{[]}}}}))]}}()"
      expect(balanced_delims?(string1)).to be true
      expect(balanced_delims?(string2)).to be true
      expect(balanced_delims?(string3)).to be true
    end

    it "returns false when there are any delimiters that are not balanced" do
      string1 = "((({[{}]}))"
      string2 = "{}}(([{}]))([])"
      string3 = "([)]"
      string4 = "([([()]]))"

      expect(balanced_delims?(string1)).to be false
      expect(balanced_delims?(string2)).to be false
      expect(balanced_delims?(string3)).to be false
      expect(balanced_delims?(string4)).to be false
    end
  end
end

# def balanced_delims?(string_of_delimiters)
#   #binding.pry
#   next_close = nil
#   counter = {
#               "(" => 0,
#               "{" => 0,
#               "[" => 0,
#               ")" => 0,
#               "}" => 0,
#               "]" => 0
#             }

#   string_of_delimiters.each_char do |char|
#     #binding.pry
#     if (counter[")"] > counter["("] || counter["}"] > counter["{"] || counter["]"] > counter["["]) || violates_next_close(next_close, char)
#       return false
#     else
#       if char == "("
#         next_close = ")"
#       elsif char == "{"
#         next_close = "}"
#       elsif char == "["
#         next_close = "]"
#       end
#       #binding.pry
#       counter[char] += 1 if counter[char]
#     end
#   end

#   counter[")"] == counter["("] && counter["}"] == counter["{"] && counter["]"] == counter["["]
# end

# def violates_next_close(next_close, char)
#   #binding.pry if next_close == "]" && char == ")"
#   if char == "]" || char == "}" || char == ")" && next_close
#     # binding.pry
#     next_close != char
#   else
#     false
#   end
# end

# def substring_balanced?(string_of_delimiters)
#   counter = {
#               "(" => 0,
#               "{" => 0,
#               "[" => 0,
#               ")" => 0,
#               "}" => 0,
#               "]" => 0
#             }

#   string_of_delimiters.each_char do |char|
#     if counter[")"] > counter["("] || counter["}"] > counter["{"] || counter["]"] > counter["["]
#       return false
#     else
#       counter[char] += 1 if counter[char]
#     end
#   end

#   counter[")"] == counter["("] && counter["}"] == counter["{"] && counter["]"] == counter["["]
# end

# def balanced_delims?(string_of_delimiters)
#   if substring_balanced?(string_of_delimiters)
#     balanced = true
#     substrings = string_of_delimiters.match(/((?<=\()[^\(\)]*(?=\))|(?<=\[)[^\[\]]*(?=\])|(?<=\{)[^\{\}]*(?=\}))/).captures
#     substrings.each do |substring|
#       if !substring_balanced?(substring)
#         return false
#       end
#     end
#   else
#     balanced = false
#   end
#   balanced
# end
