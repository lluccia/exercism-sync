# Search an array for a value and return the index.
#
# + array - a sorted array of integers
# + value - the integer item to find
# + return - the index of the value, or nil if the value is not found
public function find(int[] array, int value) returns int? {
    int low = 0;
    int high = array.length() - 1;
    
    while low <= high {
        int mid = low + (high - low) / 2;
        
        if (array[mid] == value) {
            return mid;
        }

        if (array[mid] < value) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
}
