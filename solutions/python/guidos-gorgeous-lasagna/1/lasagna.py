
"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language: https://en.wikipedia.org/wiki/Guido_van_Rossum
"""

EXPECTED_BAKE_TIME = 40
LAYER_PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed in minutes.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    
    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time in minutes.

    :param number_of_layers: int - number of layers in lasagna
    :return: int - preparation time of the lasanha in minutes.
    """
    
    return LAYER_PREPARATION_TIME * number_of_layers

def elapsed_time_in_minutes(number_of_layers, time_in_oven):
    """Calculate the elapsed time considering the layer preparation and how long the lasagna has been in the oven.

    :param number_of_layers: int - number of layers in lasagna
    :param time_in_oven: int - time in minutes the lasanha is already baking in the oven
    :return: int - time elapsed in minutes since lasagna preparation 
    """
    
    return preparation_time_in_minutes(number_of_layers) + time_in_oven


