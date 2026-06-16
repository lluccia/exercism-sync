class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    def __init__(self, message):
        pass


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    def __init__(self, message):
        pass


class CircularBuffer:
    def __init__(self, capacity):
        self.size = 0
        self.items = [None] * capacity
        self.capacity = capacity

        self.read_pointer = 0
        self.write_pointer = 0


    def read(self):
        if self.size == 0:
            raise BufferEmptyException("Circular buffer is empty")

        self.size -= 1

        item = self.items[self.read_pointer]
        self.__increment_read_pointer()

        return item


    def write(self, data):
        if self.size == self.capacity:
            raise BufferFullException("Circular buffer is full")

        self.size += 1

        self.items[self.write_pointer] = data
        self.__increment_write_pointer()


    def overwrite(self, data):
        if self.size == self.capacity:
            self.size -= 1
            self.__increment_read_pointer()

        self.write(data)


    def clear(self):
        self.size = 0
        self.read_pointer = self.write_pointer


    def __increment_pointer(self, position):
        return (position + 1) % self.capacity

    def __increment_read_pointer(self):
        self.read_pointer = self.__increment_pointer(self.read_pointer)

    def __increment_write_pointer(self):
        self.write_pointer = self.__increment_pointer(self.write_pointer)
