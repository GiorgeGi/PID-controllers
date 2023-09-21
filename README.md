# PID-controllers
A MATLAB/Octave script for PID testing and analysis

A small project made for tuning the PID controller, finding the correct proportional, integral and derivative values, used in an Arduino Line Follower Robot.
It can be used for many other applications that require tuning.
Depending on the number of PID gain variables one can choose from the various controllers, input test values and get a graph of the Step response.
Based on the plotted step response it can be judged if the specific values create a solid, error prone PID control system.
A great image describing the theory behind step response can be seen below but there is more information about the subject out there.
It has been tested and if the gain values are correct, the graph will prove their accuracy; helping in development by speeding up the real time testing proccess.
It contains loop statements for testing multiple sets of gain values per controller without repeatedly executing the script.
The project works both in MATLAB and Octave. For MATLAB simply comment out any package loads.
In MATLAB it also prints the transfer function H while in octave does not, but there is a commented command that solves the issue.


![Typical-step-response-graph](https://github.com/GiorgeGi/PID-controllers/assets/97761991/5841744b-e6c4-4747-b959-118e6442cd08)
