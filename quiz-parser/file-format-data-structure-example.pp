[{"meta"=>
   {"title"=>"Test quiz",
    "start_day"=>1,
    "start_month"=>10,
    "start_year"=>2015,
    "start_hour"=>9,
    "start_minute"=>0,
    "repeat"=>1,
    "feedback"=>3}},
 {"text"=>"Long text over several lines which will be parsed by Markdown."},
 {"multiple_choice"=>
   {"text"=>"What is the largest US state?",
    "options"=>
     [["right", "Alaska", "You really know your stuff"],
      ["wrong", "Hawaii", "Not big enough."],
      ["wrong", "Texas", "That's pretty big, but think colder."]],
    "randomize"=>"false"}},
 {"multiple_choice"=>
   {"text"=>"What distribution is on the graph?",
    "picture"=>["https://example.com/logo.svg", "y=400"],
    "options"=>
     [["right", "Normal"], ["wrong", "Binomial"], ["wrong", "Poisson"]],
    "randomize"=>"false",
    "hint"=>["Look at zero", "Loo at the tails"]}},
 {"text"=>"### Now comes the hard questionsDont feel bad..."},
 {"multiple_choice"=>
   {"text"=>"When $a \ne 0$, there...",
    "options"=>[["right", "yes", "That was good"], ["wrong", "no"]]}},
 {"draw"=>
   {"text"=>
     "Draw lines with your mouse where the graph have a negative derivative.",
    "canvas"=>["https://example.com/plot.png", "x=300"]}},
 {"random"=>
   [{"multiple_choice"=>
      {"text"=>"What distribution is on the graph?",
       "picture"=>["https://example.com/logo.svg", "y=400"],
       "options"=>
        [["right", "Normal"], ["wrong", "Binomial"], ["wrong", "Poisson"]],
       "randomize"=>"false",
       "hint"=>["Look at zero", "Loo at the tails"]}},
    {"multiple_choice"=>
      {"text"=>"What is the largest US state?",
       "options"=>
        [["right", "Alaska", "You really know your stuff"],
         ["wrong", "Hawaii", "Not big enough."],
         ["wrong", "Texas", "That's pretty big, but think colder."]],
       "randomize"=>"false"}}]},
 {"survey"=>{"text"=>"What did you think about the quiz?"}}]
