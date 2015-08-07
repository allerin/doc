## Quiz file format specification

A `.quiz` file is an UTF-8 encoded file written in a text editor. It contains blocks defined by `begin:name_of_block_here` and `end:name_of_block_here`. The order of the blocks are important, as they determine the order content of the final html. A block can be indented with any number of spaces and tabs. The same goes for the content in the block. Block content in the following will be called commands.

Blocks and commands are case-insensitive.

An argument for a command must be quoted with either `"` or `'` unless it is a word (from a regex point of view), then it doesn't need to be quoted.

New lines and comments are allowed inside the block. Comments starts with any number of spaces and tabs followed by `#`.

When parsing the file, syntax errors should be cought and an error message of what the problem is, and for cases where a line number can be given, this should also be displayed.


## Text block

Here is an example.

```
begin:text
Long text over several lines which will be parsed by Markdown.
end:text
```

The content of text blocks are parsed though CommonMark, which will convert many CommonMark (Markdown) to html.

Another example

```
begin:text
## Now comes the hard questions
## These are not comments because they are inside a text block. ## is valid Markdown.

Don't feel bad if you get them wrong.
end:text
```

The lines starting with `#` are not comments, but valid CommonMark, so the parser should be strict to parse everything inside a text block.


## Comments are new lines
Comments and new lines are allowed between the blocks.

## Multiple choice question block

An example

```
begin:multiple_choice
  text "What is the largest US state?"
  right 'Alaska' "You really know your stuff"
  wrong  'Hawaii' "Not big enough."
  wrong  'Texas'  "That's pretty big, but think colder."
  randomize false
end:multiple_choice
```

`text` takes one argument which is parsed though [CommonMark](http://commonmark.org/). `text` are required. Had the argument been `Test` then the command could have been written as `text Test`. Had the argument been `Martin's quiz` then it should have been written as `text 'Martin''s quiz'`.

`right` and `wrong` are the possible answers for the question. Multiple choice can only have one `right`. The first argument is the text of the answer. The second argument is a teacher comment, which was mentioned in the meta block section. This is displayed next to the question if `feedback` level is 2 or 3, but only for the selected answer. Both arguments are parsed though CommonMark. As seen here there can be one or more spaces and tabs between commands and arguments and also between arguments. At least one `right` and one `wrong` is required.

`randomize` is optional and takes the boolians `true`, `TRUE`, `false`, or `FALSE`. By default the order of `right` and `wrong` will be randomized, but this can be overwritten per question.

Multiple choice questions uses radio buttons.

Another example

```
begin:multiple_choice
  text "What distribution is on the graph?"
  # second argument to picture can be left out for don't scale image, y=#value#, x=#value#
  picture https://example.com/logo.svg y=400

  right 'Normal'
  wrong  'Binomial'
  wrong  'Poisson'
  randomize false
  hint 'Look at zero' 'Loo at the tails'
end:multiple_choice
```

Comments are allowed in blocks.

`picture` is optional and takes an URL as the second argument, which is required. The image will be downloaded and hosted on the quiz website with an unpredictable name. A third argument is optional and can either be `x=an_integer_here` or `y=an_integer_here`, which will scale the picture accordinging. If a third argument is not given the picture will be scaled to text width.

`hint` is optional and will make a button appear next to the question. If pressed an Ajax call will be made to the server and fetch the hint and it will be noted in the database that the student had pressed the button. In this example there are two hints and each is parsed through CommonMark. One button click is needed for each of them. 


## Multiple choice "select all that apply" questions

An example

```
begin:all_that_apply
  text "Which are American political parties?"

  right "Democrats"
  right "Republicans"
  right "Greens" "Yes, they're a party!"
  wrong  "Tories" "They're British"
  wrong  "Social Democrats"
end:all_that_apply
```

This type of question uses check boxes instead of radio buttons, which allows for multiple answers needs to be ticked off in order to get the question correct.


## MathJax

Latex commands is allowed in `text`, text blocks, `right`, `wrong`, and `hint` and MathJax should render this. An example

```
begin:multiple_choice

  begin:text
    When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
    $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$
 
    Did you knew this?
  end:text

  right "yes" "That was good"
  wrong "no"

end:multiple_choice
```

Leading spaces and tabs inside a text block should be removed before parsing it through CommonMark.


## Draw on picture question

An example

```
begin:draw
  text 'Draw lines with your mouse where the graph have a negative derivative.'
  canvas https://example.com/plot.png x=300
end:draw
```

`text` is required.

`canvas` is similar to `picture`, but also allows the student to draw on the picture.

There are many JavaScript libraries enables to draw on the canvas. JQuery also have a few of these.


## Randomize questions

An example

```
begin:random
  begin:multiple_choice
    text "Which of the following equations have you seen before?"
    right '$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$'
    wrong  '$x = {-b \pm \sqrt{b^2-4ac} \over 2b}$'
    wrong  '$x = {-b \pm \sqrt{b^2-4ac} \over 2c}$'
  end:multiple_choice

  begin:multiple_choice
    text "Which of the following equations have you seen before?"
    wrong  '$x = {-b \pm \sqrt{b^2-4ac} \over  a}$'
    right '$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$'
    wrong  '$x = {-b \pm \sqrt{b^2-4ac} \over 3a}$'
  end:multiple_choice
end:random
```

The outcome of this is just one question choosen randomly between the blocks inside the random block. The selection of the question block to display happens the first time the student clicks on the quiz. That means, that if the student revisit the quiz at a later time, the quiz will be exactly the same as the first time.


## Surveys

An example

```
begin:survey
  text "What did you think about the quiz?"
end:surveys
```

`text` is required. A free text box is under the text.

