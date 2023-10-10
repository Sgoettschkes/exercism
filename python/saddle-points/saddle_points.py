"""Figure out where to place your house"""

def saddle_points(matrix):
    """Figure out where to place your house"""
    potentials = []
    for index_row, value_row in enumerate(matrix):
        if len(matrix[0]) != len(value_row):
            raise ValueError("irregular matrix")
        max_val = max(value_row)
        for index_column, value_column in enumerate(value_row):
            if max_val == value_column:
                potentials.append((index_row, index_column, value_column))

    for pot_pos, (_, index_column, val) in enumerate(potentials):
        for value_row in matrix:
            if value_row[index_column] < val:
                potentials[pot_pos] = False
                break

    potentials = filter(lambda p: p is not False, potentials)

    result = []
    for row_num, col_num, _ in potentials:
        result.append({"row": row_num + 1, "column": col_num + 1})

    return result
