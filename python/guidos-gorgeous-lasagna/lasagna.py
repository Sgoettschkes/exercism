"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME=40

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time in minutes

    :param number_of_layers: int - the number of layers of the lasagne.
    :return: int - the time it takes to prepare the lasagne.

    Function that takes the number of layers the lasagne should have and returns the preparation time for the whole dish.
    """
    return number_of_layers * 2

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the elapsed time

    :param number_of_layers: int - the number of layers of the lasagne.
    :param elapsed_bake_time: int - the time already spend in the ofen
    :return: int - the time since you started preparing the dish

    Function that takes the number of layers the lasagne should have and the time the lasagne is in the oven and returns the time elapsed since you started cooking.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
