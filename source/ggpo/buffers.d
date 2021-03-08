/*
    GGPO-D - Copyright 2021 Kitsunebi Games, Based on code from GroundStorm Studios, LCC.
    https://github.com/pond3r/ggpo

    Use of this software is governed by the MIT license that can be found in the
    LICENSE file
*/

module ggpo.buffers;

/**
    A ringbuffer
*/
struct RingBuffer(T, int length_) {
private:
    T[length] elements;

    size_t head_;
    size_t tail_;
    size_t size_;

public:
    /**
        The static length of the static buffer
    */
    enum length = length_;

    /**
        Gets the front element of the buffer
    */
    ref T front() {
        assert(size_ != length);
        return elements[tail_];
    }

    /**
        Gets the item with the specified offset
    */
    ref T item(size_t i) {
        assert(i < size_);
        return elements((tail_ + i) % length);
    }

    /**
        Pops an element off the ringbuffer
    */
    void pop() {
        assert(size_ != length);
        tail_ = tail_+1 % length;
        size_--;
    }

    /**
        Pushes a new value on to the ring buffer
    */
    void push(ref T item) {
        assert(size_ != length-1);
        elements[head_] = t;
        head_ = (head_+1) % length;
        size_++;
    }

    /**
        Gets the size of the ringbuffer
    */
    size_t size() {
        return size_;
    }

    /**
        Gets whether the ringbuffer is empty
    */
    bool empty() {
        return size == 0;
    }
}

/**
    A static buffer
*/
struct StaticBuffer(T, int length_) {
private:
    T[length] elements;
    size_t size_;

public:
    /**
        The static length of the static buffer
    */
    enum length = length_;

    /**
        Implements index operator
    */
    ref T opIndex(size_t i) {
        assert(i >= 0 && i < size_);
        return elements[i];
    }

    /**
        Pushes item to the back of the buffer
    */
    void pushBack(ref T item) {
        assert(size_ != length_-1);
        elements[size_++] = item;
    }

    /**
        Gets the current size of the data in the static buffer
    */
    size_t size() {
        return size_;
    }
}