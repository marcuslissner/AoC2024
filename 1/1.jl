using StatsBase

# 1
function a()
    leftrow = []
    rightrow = []

    for line in eachline("1/input")
        left, right = split(line)
        push!(leftrow, parse(Int, left))
        push!(rightrow, parse(Int, right))
    end

    sort!(leftrow)
    sort!(rightrow)

    distances = []

    for (left, right) in zip(leftrow, rightrow)
        push!(distances, abs(left - right))
    end

    sum(distances)
end

# 2
function countoccurrences(collection)
    occurences = Dict{Int,Int}()
    for num in collection
        if num in keys(occurences)
            occurences[num] += 1
        else
            occurences[num] = 1
        end
    end
    return occurences
end

function b()
    leftrow = []
    rightrow = []

    for line in eachline("1/input")
        left, right = split(line)
        push!(leftrow, parse(Int, left))
        push!(rightrow, parse(Int, right))
    end

    occurrences = countoccurrences(rightrow)

    sum = 0

    for num in leftrow
        sum += get(occurrences, num, 0) * num
    end

    sum
end

println(a())
println(b())
