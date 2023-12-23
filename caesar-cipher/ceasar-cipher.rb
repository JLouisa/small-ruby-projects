def upcased_Cipher(num)
    new_num = num

    if num > 90
        new_num = (num - 90) + 64
    end

    return new_num.chr
end

def downcased_Cipher(num)
    new_num = num

    if num > 122
        new_num = (num - 122) + 96
    end
    
    return new_num.chr
end

def create_arr(word)
    return word.split('')
end

def ceasar_cipher(word, shift)
    theword = create_arr(word)
    the_new_word = theword.map do |letter|
        if letter == letter.upcase
            new_word_U = letter.ord + shift
            upcased_Cipher(new_word_U)
        else 
            new_word_D = letter.ord + shift
            downcased_Cipher(new_word_D)
        end
    end
    return the_new_word.join
end

puts "Please enter the word"
given_word = gets.chomp
puts "Please enter the shift number for encryption"
given_shift = gets.chomp.to_i
cc = ceasar_cipher(given_word, given_shift)
puts "The encrypted word is:"
puts cc