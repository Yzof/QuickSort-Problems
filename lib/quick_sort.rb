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
    prc ||= Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    #Call partition on the input array
    return array if length <= 1

    #Recursively call sort on the left and right half
    #of the array, passing in the start index and the
    #"length" which is really the ending index

    pivot = partition(array, start, length, &prc)

    new_length = length / 2

    sort2!(array, pivot - 1, new_length, &prc)
    sort2!(array, pivot, new_length, &prc)
    # The partition method will return to you the pivot index
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    #This will swap elements in place
    # #Pick a random pivot point
    # gen = Random.new
    # pivot_idx = gen.rand(start...length)
    pivot_idx = (length / 2) + start

    swap(array, start, pivot_idx)
    #Note a 'barrier', everything to the left is greater than the
    # pivot, everything to the right is less than or equal to
    barrier_idx = start + 1
    (length - 1).times do |num|
      idx = num + start + 1

      if prc.call(array[start], array[idx]) != -1 && barrier_idx < (length + start)
        swap(array, barrier_idx, idx)
        barrier_idx += 1
      end
    end

    # if while iterating, an element is less than the pivot
    # swap it with the element that is to the right of the barrier
    # and move the barrier over one

    #After you iterate through the whole array, your barrier should
    #be around the center of the elements. You then want to swap
    #the pivot(which should have been the first element) with the
    #element directly to the right of the barrier
    swap(array, barrier_idx - 1, start)

    pivot_idx
  end
end
