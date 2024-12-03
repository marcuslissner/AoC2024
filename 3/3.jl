# 1
function a()
    sum = 0
    pattern = r"mul\((?<left>\d+),(?<right>\d+)\)"
    memory = string(readlines("3/input"))
    for match in eachmatch(pattern, memory)
        sum += parse(Int, match["left"]) * parse(Int, match["right"])
    end

    return sum
end

# 2
function b()
    enabled = true
    sum = 0
    pattern = r"don't\(\)|do\(\)|mul\((?<left>\d+),(?<right>\d+)\)"
    memory = string(readlines("3/input"))
    for match in eachmatch(pattern, memory)
        if match.match == "do()"
            enabled = true
        elseif match.match == "don't()"
            enabled = false
        else
            if enabled
                sum += parse(Int, match["left"]) * parse(Int, match["right"])
            end
        end
    end

    return sum
end

println(a())
println(b())

