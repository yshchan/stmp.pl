# Create a single html file.
# Usage: stmp-one.pl [name]
# 
# Copyright (c) Yashwant Chauhan 2014

use strict;
use warnings;

my $name = "newly-created-site";

if (defined($ARGV[0])) {
  chomp($name = $ARGV[0]);
}

if (-d $name) {
  if ($name == "newly-created-site") {
    print("$name already exists.\nMaybe you should try using a name other than the default, hey?");
  } else {
    print("#{name} already exists.\nHow about choosing another fancy name?");
  }
} else { 
  # create a new directory
  mkdir($name);
  print "Brewing $name...\n";
  chdir($name); # equivalent to cd $dirname

  my @content = ("<!DOCTYPE html>\n<html>\n<head>\n\t<title>$name</title>\n\t<style>\n\t\t/* Make your website look pretty here. */\n\t\tbody { margin: 0; padding:0; }\n\t\t#wrapper { margin: 10px; padding: 5px }\n\t</style>\n\t<script type='text/javascript'>\n\t\t// Type up all your fancy magic here\n\t</script>\n</head>\n<body>\n\t<!-- Cook up something cool! -->\n\t<div id='wrapper'>\n\t</div>\n</body>\n</html>");

  # index.html
  open(INDEXFILE, ">>index.html");
  print INDEXFILE "$content[0]";
  print "Creating index.html ...\n";
  close(INDEXFILE);
}

