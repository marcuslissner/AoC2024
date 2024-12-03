# 1
function a()
    safesum = 0

    for line in readlines("2/input")
        levels = map(num -> parse(Int, num), split(line))
        slope = 0
        lastnum = 0
        safe = true
        for level in levels
            if lastnum == 0
                lastnum = level
                continue
            end

            if (slope > 0 && level - lastnum < 0) || (slope < 0 && level - lastnum > 0) || (abs(level - lastnum) < 1) || (abs(level - lastnum) > 3)
                safe = false
                break
            end

            slope = level - lastnum
            lastnum = level
        end

        if safe
            safesum += 1
        end
    end

    return safesum
end

# 2
function b()
    safesum = 0

    for line in readlines("2/input")
        levels = map(num -> parse(Int, num), split(line))
        for i in -1:(length(levels)-1)
            safe = true
            pointer = 0
            slope = 0
            lastnum = 0
            for level in levels
                if pointer == i
                    pointer += 1
                    continue
                end
                if lastnum == 0
                    lastnum = level
                    pointer += 1
                    continue
                end
                if (slope > 0 && level - lastnum < 0) || (slope < 0 && level - lastnum > 0) || (abs(level - lastnum) < 1) || (abs(level - lastnum) > 3)
                    safe = false
                    break
                end

                slope = level - lastnum
                lastnum = level
                pointer += 1
            end

            if safe
                safesum += 1
                break
            end
        end
    end

    return safesum
end

println(a())
println(b())
