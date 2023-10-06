pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    var sliced_array: []const T = items;
    var pos_offset: usize = 0;

    while(sliced_array.len > 0) {
        if (sliced_array.len == 1) {
            if (sliced_array[0] == target) {
                return pos_offset;
            }
            return null;
        }
        
        var middle_pos: usize = @divFloor(sliced_array.len, 2);
        var middle: T = items[middle_pos];

        if (middle == target) {
            return middle_pos + pos_offset;
        } else if (middle > target) {
            sliced_array = sliced_array[0..middle_pos];
        } else {
            pos_offset += middle_pos; 
            sliced_array = sliced_array[middle_pos..sliced_array.len];
        }
    }
    
    return null;
}
