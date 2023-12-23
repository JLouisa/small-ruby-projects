theArray = [17,3,6,9,15,8,6,1,10]

def stock_picker(arr)
    max = 0
    min = 0
    result = 0
    arr.each do |num|
        arr.each do |number|
            if (num - number) > result && arr.index(num) > arr.index(number)
            result = num - number
            max = num
            min = number
            end
        end
    end
    p "Buy on low at #{min}(i:#{arr.index(min)}) and sell at #{max}(i:#{arr.index(max)}), with a profit of #{result}"
end

stock_picker(theArray)