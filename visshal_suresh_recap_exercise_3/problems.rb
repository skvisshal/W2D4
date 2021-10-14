def no_dupes?(arr)
    arr.select do |ele|
        arr.count {|ele2| ele2 == ele} < 2
    end
end

def no_consecutive_repeats?(arr)
    arr.each.with_index do |ele, i|
        return false if ele == arr[i + 1]
    end
    true
end

def char_indices(str)
    result = {}
    str.each_char.with_index do |char, i|
        result.include?(char) ? result[char].push(i) : result[char] = [i]
    end
    result
end

def longest_streak(str)
    maxStreak = [0,""]
    currStreak = [0,""]
    str.each_char.with_index do |char, i|
        currStreak[0] += 1
        currStreak[1] += char
        if char != str[i+1]
            if maxStreak[0] <= currStreak[0]
                maxStreak = currStreak
            end
            currStreak = [0,""]
        end
    end
    maxStreak[1]
end

def bi_prime?(num)
    (2...num).each {|i| return true if prime?(i) && num % i == 0 && prime?(num/i)}
    false
end

def prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end

def vigenere_cipher(message, keys)
    result = []
    message.each_char.with_index do |char, i|
        result.push(caesar_cipher(char,keys[i % keys.length]))
    end
    result.join
end

def caesar_cipher(str, num)
    alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    array = str.split("")
    array.map! do |char|
        alphabet[(alphabet.index(char) + num) % 26]
    end
    array.join
end

def vowel_rotate(str)
    chars = str.split("")
    prevVowel = chars[str.rindex(/[aeiou]/)]
    chars.map! do |char|
        if "aeiou".include?(char)
            temp = prevVowel
            prevVowel = char
            temp
        else
            char
        end
    end
    chars.join
end

class String

    def select(&prc)
        result = ""
        return result if prc == nil
        self.each_char {|char| result += char if prc.call(char)}
        result
    end

    def map!(&prc)
        (0...self.length).each do |i|
            self[i] = prc.call(self[i],i)
        end
        self
    end

end

def multiply(a, b)
    return a if b == 1
    return b if b == 0
    if b > 1
        a + multiply(a,b-1)
    else
        -a - multiply(a,-b-1)
    end
end

def lucas_sequence(num)
    return [] if num == 0
    return lucas_sequence(num-1) + [2] if num == 1
    return lucas_sequence(num-1) + [1] if num == 2
    lucas_sequence(num-1) + [lucas_sequence(num-1).last(2).inject {|a,e| a + e}]
end

def prime_factorization(num)
    return [num] if prime?(num)
    (2...num+1).each do |i|
        if prime?(i) && num % i ==0
            return [i] + prime_factorization(num / i)
        end
    end
end

