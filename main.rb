require 'sinatra' 

require 'slim'

get '/' do 
  
  @myvar = 5
  @lists = [
  	5,
  	6,
  	7,
  	8
  ]
  slim :indexDo
  # file = File.open("./index.html", "r")
  # contents = file.read
end

__END__

@@layout 
doctype html 
html
  head 
    meta charset="utf-8" 
    title Just Do It 
    link rel="stylesheet" media="screen, projection" href="/styles.css" 
    /[if lt IE 9] 
      script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" 
    javascript:
      alert('Slim supports embedded javascript!')
  body 
    h1 Just Do It 
    == yield

@@indexDo 
h2 My Tasks
= @myvar
ul.tasks
  li Get Milk #{@myvar}
ul.lists
- @lists.each do |a|
	li Wait is #{a}