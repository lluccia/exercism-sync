import java.util.Arrays;

class DnDCharacter {
    
    private int ability = randomAttribute();

    private int strength = randomAttribute();
    private int dexterity = randomAttribute();
    private int constitution = randomAttribute();
    private int intelligence = randomAttribute();
    private int wisdom = randomAttribute();
    private int charisma = randomAttribute();

    private int hitpoints = 10 + modifier(constitution);

    int ability() {
        return ability;
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

    private int randomAttribute() {
        int[] rolls = new int[5];

        for (int i=0; i < rolls.length; i++)
            rolls[i] = rollDice();

        Arrays.sort(rolls);

        return rolls[0] + rolls[1] + rolls[2];
    }

    private int rollDice() {
        return (int) Math.random() * 5 + 1;
    }

}
