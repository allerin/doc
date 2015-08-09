### Quiz website

This can be broken down into the following sub projects

* `.quiz` file parser
* Generate Bootstrap quiz
* Parse through CommonMark and MathJax
* Add WebSockets to quiz
* `picture`, `canvas` and download from Github repo
* Center `picture`, `canvas` and tables
* Admin panel, Auditor panel, Student panel
* CAS login


##### `.quiz` file parser (Ruby)

`file-format.quiz` is an example of how a teacher might write a quiz.

`file-format-data-structure-example.rb` is a hand written example of how the data structure could be.

`file-format-data-structure-example.ap` and `file-format-data-structure-examfile-format-data-structure-example.pp` are output from `file-format-data-structure-example.rb`.

`file-format.md` gives hopefully a complete explanation of the file format.

In the repository of the gem, please provide a `Dockerfile` similar this this

```Dockerfile
FROM fedora:22

RUN dnf -y update && \
    dnf -y install ruby git && \
    dnf clean all

RUN cd / && \
    git clone https://github.com/#name of gem# && \
    cd /#name of gem# && \
    bundle install

ENTRYPOINT ["run.rb", "test.quiz"]
```

where `run.rb` take a quiz file as argument. To test other quiz files then `test.quiz` one could

```bash
NAME="#name of gem#"
git clone https://github.com/$NAME
cd $NAME
docker build -t $NAME .

docker run --rm -v $(pwd):/$NAME $NAME a_new_test.quiz
```

##### Generate Bootstrap quiz (Ruby, Bootstrap)

After a Ruby `.quiz` file parser have been written which can parse `file-format.quiz` into a data structure, a Bootstrap quiz have to be generated. This involves making a Bootstrap Ruby template and inserting the static content from the data structure, so the outcome is a html file which can be opened in a browser.

The default Bootstrap widgets should be fine, but there should be a clear separation between questions.


##### Parse through CommonMark and MathJax

Strings and text blocks should now be parsed though the CommonMark parser and MathJax library added.


##### Add WebSockets to quiz

Everytime a student clicks on an answer it should be sent back to the web server (WebSockets), so in case the students computer crashes, the student can just login again and no progress have been lost. Everything should be saved in MongoDB. I will provide a Dockerfile for building the MongoDB container.

This milestone should also include the interpretation of `feedback` in the `meta` block described in `doc/file-format.md` and the `hint` feature. When `hint` is used, a hint button is added to the question, and if the student clicks this, WebSockets fetches the hint, and registers it along a timestamp.

A "Hand in" button should be at the bottom, and when pressed a "Are you sure?" Bootstrap modal. If "yes", then the feedback is given accordingly to the `feedback` level and the quiz is registered as handed in.


##### `picture`, `canvas`, and download from Github repo

The pictures in `picture` and `canvas` should be downloaded and hosted on the quiz website with an unpredictable name. The `.quiz` file should now be downloaded (git pull) from Github.


##### Center `picture`, `canvas` and tables

I think by default `picture`, `canvas` and tables are left aligned, so a small post-processing should done to center these.


##### Admin panel, Auditor panel, Student panel

Drawings will come once approved.

* 0: nothing
* 1: show number of correct answers
* 2: show which were correct of the ones submitted
* 3: show complete solution


##### CAS login

There is an ACL concept for logging in for both teachers and students, where the memberships are extracted from an existing LDAP server. 

See source code for the current implementation

https://github.com/dtu-compute/php-cas-login

and pictures of what it looks like

https://github.com/dtu-compute/doc/tree/master/cas-login

A similar login module should be written in Ruby.
