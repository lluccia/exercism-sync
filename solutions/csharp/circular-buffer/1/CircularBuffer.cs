using System;

public class CircularBuffer<T>
{
    private T[] buffer;

    private int readPointer = 0;
    private int writePointer = 0;
    
    private int size = 0;
    
    public CircularBuffer(int capacity)
    {
        buffer = new T[capacity];
    }

    public T Read()
    {
        if (IsEmpty())
            throw new InvalidOperationException("Buffer is empty.");

        var result = buffer[readPointer];

        AdvanceReadPointer();
        size--;
        
        return result;
    }

    public void Write(T value)
    {
        if (IsFull())
            throw new InvalidOperationException("Buffer is full.");

        buffer[writePointer] = value;
        
        AdvanceWritePointer();
        size++;
    }
    
    public void Overwrite(T value)
    {
        buffer[writePointer] = value;

        AdvanceWritePointer();

        if (IsFull()) 
            AdvanceReadPointer();
        else
            size++;
    }

    public void Clear()
    {
        readPointer = writePointer;
        size = 0;
    }

    private void AdvanceReadPointer()
    {
        readPointer++;
        if (readPointer == buffer.Length)
           readPointer = 0;
    }

    private void AdvanceWritePointer()
    {
        writePointer++;
        if (writePointer == buffer.Length)
           writePointer = 0;
    }


    private bool IsEmpty() => size == 0;
    
    private bool IsFull() => size == buffer.Length;
}