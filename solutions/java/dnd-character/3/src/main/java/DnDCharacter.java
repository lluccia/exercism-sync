import java.util.ArrayList;
import java.util.List;

class DnDCharacter {
    
    private int strength = ability(rollDice());
    private int dexterity = ability(rollDice());
    private int constitution = ability(rollDice());
    private int intelligence = ability(rollDice());
    private int wisdom = ability(rollDice());
    private int charisma = ability(rollDice());

    private int hitpoints = 10 + modifier(constitution);

    int ability(List<Integer> rolls) {
        return rolls.stream().sorted().skip(1)
            .reduce(0, Integer::sum);
    }

    int modifier(int constitution) {
        return (int) Math.floor((constitution - 10) / 2.0);
    }

    int getStrength() {
        return strength;
    }

    int getDexterity() {
        return dexterity;
    }

    int getConstitution() {
        return constitution;
    }

    int getIntelligence() {
        return intelligence;
    }

    int getWisdom() {
        return wisdom;
    }

    int getCharisma() {
        return charisma;
    }

    int getHitpoints() {
        return hitpoints;
    }

    List<Integer> rollDice() {
        List<Integer> rolls = new ArrayList<>();

        for(int i = 0; i < 4; i++)
            rolls.add((int) (Math.random() * 6) + 1);

        return rolls;
    }

}
