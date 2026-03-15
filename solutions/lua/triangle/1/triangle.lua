local triangle = {}

function triangle.kind(a, b, c)
    if a <= 0 or b <= 0 or c <= 0 then
      error('Input Error')
    end

    if not (a + b >= c) or not (b + c >= a) or not (a + c >= b) then
      error('Input Error')
    end
    
    if a == b and b == c then
      return 'equilateral'
    elseif a == b or b == c or a == c then
      return 'isosceles'
    else
      return 'scalene'
    end
end

return triangle
