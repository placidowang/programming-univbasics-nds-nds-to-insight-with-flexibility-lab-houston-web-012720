h = { a: 1, b: 2, c: 3 }

def do_something_to_hash(hash)
  hash.each_value do |value|
    p value
  end
end

do_something_to_hash(h)