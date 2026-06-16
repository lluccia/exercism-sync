class RotationalCipher {

    private var key:Int
    private var cypher:MutableMap<Char, Char> = mutableMapOf()

    constructor(key: Int) {
        this.key = key

        for (c in 'a'..'z') {
            cypher.put(c, (((c.code - 'a'.code + key) % 26) + 'a'.code).toChar())
        }
        for (c in 'A'..'Z') {
            cypher.put(c, (((c.code - 'A'.code + key) % 26) + 'A'.code).toChar())
        }
    }

    fun encode(text: String): String {
        return text.map { c -> cypher.getOrDefault(c, c) }
            .joinToString( separator = "" )
    }
}
