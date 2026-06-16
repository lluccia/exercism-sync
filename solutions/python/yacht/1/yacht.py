# Score categories.
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 10
FOUR_OF_A_KIND = 11
LITTLE_STRAIGHT = 12
BIG_STRAIGHT = 13
CHOICE = 14
YACHT = 25


def score(dice, category):

    if category in [ONES, TWOS, THREES, FOURS, FIVES, SIXES]:
        return sum(filter(lambda d: d == category, dice))

    if category == FULL_HOUSE:
        sorted_dice = sorted(dice)
        if ((sorted_dice[0] == sorted_dice[1] and
                sorted_dice[2] == sorted_dice[3] == sorted_dice[4])
                or (sorted_dice[0] == sorted_dice[1] == sorted_dice[2] and
                    sorted_dice[3] == sorted_dice[4])) \
                and sorted_dice[0] != sorted_dice[4]:
            return sum(dice)

    if category == FOUR_OF_A_KIND:
        sorted_dice = sorted(dice)
        if (sorted_dice[0] == sorted_dice[1] ==
            sorted_dice[2] == sorted_dice[3] or
                sorted_dice[1] == sorted_dice[2] ==
                sorted_dice[3] == sorted_dice[4]):
            return sorted_dice[1] * 4

    if category == LITTLE_STRAIGHT:
        if sorted(dice) == [1, 2, 3, 4, 5]:
            return sum(dice) + 15

    if category == BIG_STRAIGHT:
        if sorted(dice) == [2, 3, 4, 5, 6]:
            return sum(dice) + 10

    if category == CHOICE:
        return sum(dice)

    if category == YACHT:
        if dice[0] == dice[1] == dice[2] == dice[3] == dice[4]:
            return sum(dice) + 25

    return 0
