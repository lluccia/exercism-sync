import java.util.List;

class Knapsack {

    int maximumValue(int maximumWeight, List<Item> items) {
        if (items.isEmpty()) { 
            return 0;
        } else {
            Item item = items.getFirst();
            if (item.weight > maximumWeight) {
                return maximumValue(maximumWeight, items.subList(1, items.size()));
            } else {
                return Math.max(
                    maximumValue(maximumWeight, items.subList(1, items.size())),
                    item.value + maximumValue(maximumWeight - item.weight, items.subList(1, items.size()))
                );
            }
        }
    }

}
