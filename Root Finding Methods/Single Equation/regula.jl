function regula(f, a, b, ε, imax)
#Uses regula falsi method to find numerical solution of equation f(x) = 0 within a given interval [a, b]
#Input:
#   f: anonymous function to find the root f(x)=0
#   a,b: lower and upper bound of initial interval that contains a root
#   ε: required tolerance of solution
#   imax: maximum iterations to calculate roots (will throw error if exceeded)
    x = typemax(Float64) #root (solution)
    tolerance = typemax(Float64) #tolerance in function
    fx = typemax(Float64) #function evaluated at x

    #check if given initial interval [a,b] contains a root
    fa = f(a); fb = f(b)
    if fa*fb > 0
        error("Interval [a,b] does not contain a root. f(a) and f(b) have the same sign.")
    end

    for i in 1:imax
        x = (a*fb - b*fa)/(fb - fa)
        fx = f(x) #to reduce function calls
        tolerance = abs(fx)

        if tolerance < ε
            break
        end

        if fa*fx < 0
            b = x #solution is in interval [a,x]
            fb = fx
        elseif fa*fx > 0
            a = x #solution is in interval [x,b]
            fa = fx 
        else #fa*fx == 0
            break
        end
        
        if i == imax
            error(string("Solution not found in ", imax, " intervals."))
        end

    end 
    
    return x

end