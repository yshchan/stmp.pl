# Create a directory with index.html, style.css and script.js
# Usage: stmp.pl [dir name] [css name] [js name]
# 
# Copyright (c) Yashwant Chauhan 2014

use strict;
use warnings;

my $dirname = "newly-created-site";
my $cssname = "style";
my $jsname = "script";

if (defined($ARGV[0])) {
  chomp($dirname = $ARGV[0]);
}

if (defined($ARGV[1])) {
  chomp($cssname = $ARGV[0]);  
}

if (defined($ARGV[2])) {
  chomp($jsname = $ARGV[0]);  
}

if (-d $dirname) {
  if ($dirname == "newly-created-site") {
    print("$dirname already exists.\nMaybe you should try using a name other than the default, hey?");
  } else {
    print("#{dirname} already exists.\nHow about choosing another fancy name?");
  }
} else { 
  # create a new directory
  mkdir($dirname);
  print "Brewing $dirname...\n";
  chdir($dirname); # equivalent to cd $dirname

  # generate content for each file
  my @content = ("<!DOCTYPE html>\n<html>\n<head>\n\t<title>$dirname</title>\n\t<link rel='stylesheet' type='text/css' href='$cssname.css'>\n\t<script type='text/javascript' src='$jsname.js'></script>\n</head>\n<body>\n\t<!-- Cook up something cool! -->\n\t<div id='wrapper'>\n\t</div>\n</body>\n</html>", 
  "/* Make your website look pretty here. */\nbody { margin: 0; padding:0; }\n#wrapper { margin: 10px; padding: 5px }", 
  "// Type up all your fancy magic here\n");

  # index.html
  open(INDEXFILE, ">>index.html");
  print INDEXFILE "$content[0]";
  print "Creating index.html ...\n";
  close(INDEXFILE);

  # style.css
  open(CSSFILE, ">>$cssname.css");
  print CSSFILE "$content[1]";
  print "Creating $cssname.css ...\n";
  close(CSSFILE);

  # script.js
  open(JSFILE, ">>$jsname.js");
  print JSFILE "$content[2]";
  print "Creating $jsname.js ...\n";
  close(JSFILE);
}

