def pow(base, exponent)
    return 1 if exponent == 0
    result = base
    result * pow(base, exponent - 1)
end

p pow(9, 5)