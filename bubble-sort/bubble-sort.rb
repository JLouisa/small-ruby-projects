unsorted_array = [4, 3, 78, 2, 0, 2]
random_numbers = [43, 76, 21, 95, 12, 64, 33, 88, 7, 50, 14, 98, 29, 62, 91, 5, 37, 83, 18, 71]

def bubble_sort(arr)
    new_arr = arr
    temp = 0
    i = 0
    until i == new_arr.length
        if i >= 1 || i <= new_arr.length
            if new_arr[i - 1] > new_arr[i]
                temp = new_arr[i]
                new_arr[i] = new_arr[i - 1]
                new_arr[i - 1] = temp
                i = 0
            end
        end
        i += 1
    end
    return new_arr
end

p bubble_sort(unsorted_array)
p bubble_sort(random_numbers)