class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {

    private int[] buffer;
    private int r,w,size;

    CircularBuffer(int capacity) {
        buffer = new int[capacity];
    }

    def clear() {
        size = 0;
        r = w;
    }

    def read() {
        if (isEmpty()) throw new EmptyBufferException();

        size--;
        int item = buffer[r];
        r = nextPosition(r);
        
        return item;
    }

    def write(int item) {
        if (isFull()) throw new FullBufferException();

        overwrite(item);
    }

    def overwrite(int item) {
        if(isFull()) r = nextPosition(r);
        
        buffer[w] = item;
        w = nextPosition(w);
        
        size = Math.min(size+1, buffer.size());
    }

    private boolean isEmpty() {
        return size == 0;
    }

    private boolean isFull() {
        return size == buffer.size();
    }

    private int nextPosition(int n) {
        n = (n + 1) % buffer.size();
    }
}
