

method sumoftwonumbers param = a,b
return a+b
end


//x= sumoftwonumbers args = 5,6 + sumoftwonumbers args = 5,6

i = sumoftwonumbers args = 5,6

print i
println "Hello World"

println 3+3*2  //print in nextline
print "5  "  print "+ 5 is "//print in same line
println "10"
a = 200         //variable assignment
println a       //printing variable

a=a+2           //varible assignment

println "***************IF Condition**************************"

//if condition
if a > 100 do
  println "The value is "+100
else if a > 200 do
 println "The value is "+200
else if a > 300 do
   println "The value is "+300
else do
  println "The value is "+1000
end

println "***************Function call**************************"
//function declation and call


x= twice args = 2     //function call with args
println x

method twice param = n
  temp = n + n
  return temp
end

y= twice args = twice args = 2  //function call within function call
println y

println sum args = 5,6     //function call with args
method sum param = num1,num2
  temp = num1 + num2
  return temp
end
println "***************For loop**************************"
//for loop
a = 0
for i=1 to 10 do
  a = a + i
end
println a
println "***************While loop**************************"
//while loop
b = 5
while b >1 do
  b = b - 1
  print b+" "
end

println ""

println "***************Fibonacci**************************"

//fibonacci
x= fib2 args = 4
println x
method fib2 param =n
  if n < 2 do
    return n
  else do
    a = fib2 args= n-2
    c = fib2 args = n-1
    return a + c
  end
end

//Getting Input
println "Enter a number: "
l = input
print "The number you entered is " + l