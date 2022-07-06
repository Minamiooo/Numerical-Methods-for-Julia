function newraph(f::Function, ∂f::Function, x::Number, ε::Number, imax::Number)
#Uses Newton-Raphson method to find numerical solution of a differentiable equation f(x) = 0
#Input:
#   f: anonymous function to find the root f(x)=0
#   ∂f: derivative of anonymous function f
#   x: initial guess of solution
#   ε: required tolerance of solution
#   imax: maximum iterations to calculate roots (will throw error if exceeded)

    tolerance = typemax(Float64) #tolerance in function
    fx = typemax(Float64) #function evaluated at x
    ∂fx = typemax(Float64) #function evaluated at x

    for i in 1:imax
        fx = f(x); ∂fx = ∂f(x)
        x = x - fx/∂fx

        tolerance = abs(fx)

        if tolerance < ε 
            break 
        end

        if i == imax
            error(string("Solution not found in ", imax, " intervals."))
        end
    end
    return x
end