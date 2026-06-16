import java.util.List;

public class BinarySearch {

    private List<Integer> elements;
    
    public BinarySearch(List<Integer> elements) {
        this.elements = elements;
    }

    public int indexOf(int searchValue) throws ValueNotFoundException {
        int leftPosition = 0;
        int rightPosition = elements.size() - 1;

        while(leftPosition <= rightPosition) {
            int middlePosition = leftPosition + (rightPosition - leftPosition) / 2;

            int elementValue = elements.get(middlePosition);

            if (searchValue == elementValue) {
                return middlePosition;
            } else if (searchValue < elementValue) {
                rightPosition = middlePosition - 1;
            } else {
                leftPosition = middlePosition + 1;
            }
        }
        throw new ValueNotFoundException("Value not in array");
    }

}