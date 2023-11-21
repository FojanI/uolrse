# Solution 3

The following general principles can be used to investigate any code for its runtime performance.

### Code profiling
A profiler is a programming tool that can measure various aspects of program such as time spent in different functions or methods, memory usage, and frequency of function calls. This is very useful in identifying performance bottlenecks and to find out the critical parts of code that can lead to maximum improvement.

In Python, this could be achieved using the `cProfile` module. For example, your prime number identification code can be profiled as follows:
```Python
import cPrifile

# Your code ...

cProfile.run('primes(10000000)')
```
which generates an output similar to the following:
```
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.035    0.035    1.116    1.116 <string>:1(<module>)
        1    0.175    0.175    0.175    0.175 pyscript.py:10(<listcomp>)
        1    0.093    0.093    0.093    0.093 pyscript.py:27(<listcomp>)
        1    0.813    0.813    1.081    1.081 pyscript.py:3(primes)
        1    0.000    0.000    1.116    1.116 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```
It is suggested that the program be tested with a range of input sizes to get a better understanding of how the runtime changes for different input sizes. This can potentially reveal whether the runtime behaves as expected.

It should be noted that for this particular program, profiling may not be the best strategy due to simplicity of the code and minimal use of functions. Therefore, a more algorithmic approach might be a better choice.

As an alternative to `cProfile` you can use the `time()` method from the `time` module, which can potentially give more control over timing of specific code segments:
```Python
import time
start_time = time.time()

# ...
# code segment to be timed
# ...

end_time = time.time()
print("Duration %s seconds." % (end_time - start_time))
```

### Algorithmic analysis
In this approach it is important to carefully examine the high-level logic of the algorithm.
Adding print statements in the code at critical points, such as within loops or conditional blocks, can help understanding the logic and making sure the intermediary steps behave as expected.

It is quite common that redundant steps cause the code to run slower than expected. For instance, a loop may iterate more than it is necessary. This would be magnified if tested with larger inputs and profiling would be useful to test this. For example, in the following code snippet taken from your code, `s[j] = 0` would run twice for the same index `j` both inside and outside the loop. This could be avoided by also updating the index just before the inner loop.


```Python
while m <= mroot:
    if s[i]:
        j=(m*m-3)/2
        s[j]=0
        while j<half:
            s[j]=0
            j+=m

```
update:

```Python
while m <= mroot:
    if s[i]:
        j=(m*m-3)/2
        s[j]=0
        j+=m # <- added
        while j<half:
            s[j]=0
            j+=m

```

The code could potentially be further improved by examining the code based on the principles stated above and trying to find ways of avoiding repeated statements. With a little bit of Google search, I learned that there is an optimised version of this [algorithm](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Euler's_sieve) proposed by Euler.


