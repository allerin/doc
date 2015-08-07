# Project breakdown

The major groups of components that needs to be developed are

* Quiz website
* File admin panel
* Course webdesign
* Login modules
* Port PHP podcast parser to Ruby

Each of these is one project and finished one at a time. The grouping does not reflect their size, as some are small, but rather that they are independent from each other.

In the following will I propose and describe how I see each of these projects could be broken down into small milestones. If there is a better way, please let me know.

Browser wise everything have to work in Firefox and Chrome.

It is important that everything is written according to standards and good programming practices are used. The code should have unit tests, be commented, and an option to output info, warn, error, and debug logs.

Development must be done in our Github repo, where the days work is committed at the end of the day. Everything be developed in a Fedora 22 Docker container, as this is how the final product will be used.

Since everything are intended for exams, security is of most importance. It is e.g. important that the quizzes can't be taken before or after the specified time, possible to sniff traffic from other students (encryption), hijack other student sessions, take the quiz more times than specified, trick the server to give the correct answers, and so forth.

Scalability wise it should be able to handle 5000 simultaneous students taking the quiz. To some extend this also depends on the hardware, but it should be designed for this kind of scale.

All source code will be GPLv3 licensed and put on Github for others to use for free.
