class ReverseString {

    static reverse(String value) {
        if (value.size() == 0) return value

        return (value.size()-1..0).collect { i -> value[i] }.join()
    }

}
