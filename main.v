module main

import math
import vsl.deriv
import vsl.func

fn pow_function(x f64, _ []f64) f64 {
	return math.pow(x, 1.5)
}

fn main() {
	f := func.new_func(f: pow_function)
	println('f(x) = x^(3/2)')
	mut expected := 1.5 * math.sqrt(2.0)
	mut result, mut abserr := deriv.central(f, 2.0, 1e-8)
	println('x = 2.0')
	println("f'(x) = $result +/- $abserr")
	println('exact = $expected')
	expected = 0.0
	result, abserr = deriv.forward(f, 0.0, 1e-8)
	println('x = 0.0')
	println("f'(x) = $result +/- $abserr")
	println('exact = $expected')
}
