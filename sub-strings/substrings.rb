dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, arr)
    count = 0
    return arr.reduce(Hash.new(0)) do |result, num|
        if word.include?(num)
            count += 1
            result[num] = 1
            result
        end
        result
    end
end 

the_word = substrings("godown partner", dictionary)
p the_word
