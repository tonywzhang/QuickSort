class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.empty?

    # pivot = array.first

    # left = array.select { |num| pivot > num }
    # middle = array.select { |num| pivot == num }
    # right = array.select { |num| pivot < num }

    new_pivot = rand(arr.length)

    array[0], array[new_pivot] = array[new_pivot], array[0]
    pivot = array.first

    left = array.select { |num| pivot > num }
    middle = array.select { |num| pivot == num }
    right = array.select { |num| pivot < num }

    sort1(left) + middle + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)

    # [2, 1, 13, 10, 6, 4]
    #

    # BaseCase
    ## return if legnth <= 1

    # Step 1
    ## Select Pivot (first element)

    # Step 2
    ## Partition array around pivot

    # Step 3
    ## Recurse on left/right


    prc ||= Proc.new { |x, y| x <=> y }

    return array if length < 2

    idx = partition(array, start, length, &prc)

    left = idx - start
    right = length - (left + 1)

    sort2!(array, start, left, &prc)
    sort2!(array, idx + 1, right, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    new_pivot = start
    array[start], array[new_pivot] = array[new_pivot], array[start]

    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |idx|
      val = array[idx]
      if prc.call(pivot, val) == 1
        array[idx] = array[pivot_idx + 1]
        array[pivot_idx + 1] = pivot
        array[pivot_idx] = val
        pivot_idx += 1
      end
    end

    array[start], array[new_pivot] = array[new_pivot], array[start]

    pivot_idx
  end
end
