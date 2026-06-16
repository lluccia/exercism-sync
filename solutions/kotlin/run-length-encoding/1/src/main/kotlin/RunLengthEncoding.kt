object RunLengthEncoding {

    fun encode(input: String): String {
        return input.split("(?<=(.))(?!\\1)".toRegex())
            .filter { part -> part.length > 0 }
            .map { part -> 
                if (part.length > 1) "${part.length}${part[0]}" 
                else "${part[0]}"
            }
            .joinToString(separator = "")
    }

    fun decode(input: String): String {
        return input.split("(?<=(\\D))((?=\\d)|(?!\\1))".toRegex())
            .filter { part -> part.length > 0 }
            .map { part -> part.split("(?<=\\d)(?=\\D)".toRegex()) }
            .map { part -> 
                if (part.size == 1) part[0]
                else part[1].repeat(part[0].toInt())
            }
            .joinToString(separator = "")
    }
}
