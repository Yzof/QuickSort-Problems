class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  def self.swap(array, idx1, idx2)
    array[idx1], array[idx2] = array[idx2], array[idx1]
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    #Call partition on the input array

    #Recursively call sort on the left and right half
    #of the array, passing in the start index and the
    #"length" which is really the ending index

    #
  end

  def self.partition(array, start, length, &prc)
    return start if start == length
    prc ||= Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    puts "Starting Array: "
    print array
    puts " "
    #This will swap elements in place
    # #Pick a random pivot point
    # gen = Random.new
    # pivot_idx = gen.rand(start...length)
    pivot_idx = length / 2
    print "Pivot Index: "
    puts pivot_idx

    swap(array, start, pivot_idx)
    puts "Array after first swap: "
    print array
    puts " "
    #Note a 'barrier', everything to the left is greater than the
    # pivot, everything to the right is less than or equal to
    barrier_idx = start + 1
    (start + 1).upto(length - 1) do |idx|
      if prc.call(array[start], array[idx]) != -1 && barrier_idx < length
        swap(array, barrier_idx, idx)
        barrier_idx += 1
      end
    end

    puts "Array after Major Swapping: "
    print array
    puts " "
    # if while iterating, an element is less than the pivot
    # swap it with the element that is to the right of the barrier
    # and move the barrier over one

    #After you iterate through the whole array, your barrier should
    #be around the center of the elements. You then want to swap
    #the pivot(which should have been the first element) with the
    #element directly to the right of the barrier
    swap(array, barrier_idx - 1, start)
    puts "Array after Final Swap: "
    print array
    puts " "
    pivot_idx
  end
end
