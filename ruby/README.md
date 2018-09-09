# Day 2 Self-Study

## Find out how to access files with and without code blocks. What is the benefit of the code block?

Accessing a file without a block returns an opened file to a variable.

```
f = File.open(filname)
```

The benefit of the code block is that it takes care of closing the file after you've interacted with it. Using `File.open` requires manually closing the file when you're done with it.

## How would you translate a hash to an array? Can you translate arrays to hashes?

To translate a hash to an array, I'd create an array of arrays where the first member is the key from the hash and the second value is the value for the key.

You could translate an array to a hash where the key is the index of the item in the array. You'd lose the order when enumerating over the hash unless you used an ordered hash.

## Can you iterate through a hash?

Yes.

```
test = { :something => :here }
test.each { |key, value| puts "#{key}: #{value}" }
```

## What other common data structures do arrays support?

- Queue
- Tree