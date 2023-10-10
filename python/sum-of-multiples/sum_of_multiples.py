def sum_of_multiples(limit, multiples):
    result_set = set()
    for multiple in multiples:
        if multiple < 1:
            break
        result_set.update(range(multiple, limit, multiple))
    return sum(result_set)
