# Project breakdown

The major groups of components that needs to be developed are

* Quiz website
* File admin panel
* Course webdesign
* Login modules
* Port PHP podcast parser to Ruby

Each of these is one project and finished one at a time. The grouping does not reflect their size, as some are small, but rather that they are independent from each other.

In the following will I describe how I see each of these projects can be broken down into small milestones. If there is a better way, please let me know.

Browser wise everything have to work in Firefox and Chrome.

It is important that everything is written according to standards and good programming practices are used. The code should have unit tests, be commented, and an option to output info, warn, error, and debug logs.

Development must be done in our Github repo, where the days work is committed at the end of the day. Everything be developed in a Fedora 22 Docker container, as this is how the final product will be used.

Since everything are intended for exams, security is of most importance. It is e.g. important that the quizzes can't be taken before or after the specified time, possible to sniff traffic from other students (encryption), hijack other student sessions, take the quiz more times than specified, trick the server to give the correct answers, and so forth.

Scalability wise it should be able to handle 5000 simultaneous students taking the quiz. To some extend this also depends on the hardware, but it should be designed for this kind of scale.

All source code will be GPLv3 licensed and put on Github for others to use for free.


### Quiz website

This can be broken down into the following sub projects

* `.quiz` file parser
* Generate Bootstrap quiz
* Parse through CommonMark and MathJax
* Add Ajax to quiz
* `picture`, `canvas` and download from Github repo
* Center `picture`, `canvas` and tables
* Teacher admin panel, File admin panel, Student panel
* CAS login


##### `.quiz` file parser (Ruby)

`doc/file-format.quiz` is an example of how a teacher might write a quiz.

`doc/file-format-data-structure-example.rb` is a hand written example of how the data structure could be.

`doc/file-format-data-structure-example.ap` and `doc/file-format-data-structure-examfile-format-data-structure-example.pp` are output from `doc/file-format-data-structure-example.rb`.

`doc/file-format.md` gives hopefully a complete explanation of the file format.


##### Generate Bootstrap quiz (Ruby, Bootstrap)

After a Ruby `.quiz` file parser have been written which can parse `doc/file-format.quiz` into a data structure, a Bootstrap quiz have to be generated. This involves making a Bootstrap Ruby template and inserting the static content from the data structure, so the outcome is a html file which can be opened in a browser.

The default Bootstrap widgets should be fine, but there should be a clear separation between questions.


##### Parse through CommonMark and MathJax

Strings and text blocks should now be parsed though the CommonMark parser and MathJax library added.


##### Add Ajax to quiz

Everytime a student clicks on an answer it should be sent back to the web server (AJAX), so in case the students computer crashes, the student can just login again and no progress have been lost. Everything should be saved in MongoDB. I will provide a Dockerfile for building the MongoDB container.

This milestone should also include the interpretation of `feedback` in the `meta` block described in `doc/file-format.md` and the `hint` feature. When `hint` is used, a hint button is added to the question, and if the student clicks this, Ajax fetches the hint, and registers it along a timestamp.

A "Hand in" button should be at the bottom, and when pressed a "Are you sure?" Bootstrap modal. If "yes", then the feedback is given accordingly to the `feedback` level and the quiz is registered as handed in.


##### `picture`, `canvas`, and download from Github repo

The pictures in `picture` and `canvas` should be downloaded and hosted on the quiz website with an unpredictable name. The `.quiz` file should now be downloaded (git pull) from Github.


##### Center `picture`, `canvas` and tables

I think by default `picture`, `canvas` and tables are left aligned, so a small post-processing should done to center these.


##### Teacher admin panel, File admin panel, Student panel

repeat, randomize, random, start, finish,

##### CAS login

There is an ACL concept for logging in for both teachers and students, where the memberships are extracted from an existing LDAP server. 





### File admin panel

### Course webdesign

### Login modules

kursus site login, askbot login, stackedit login + kursus select + config


### Port PHP podcast parser to Ruby

