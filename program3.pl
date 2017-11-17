#!/usr/bin/perl

# Using XHTML, PERL and MySQL, Write a program to insert name and age information
# entered by the user into a table and display the current contents of this table

use CGI':standard';
use DBI;
$nam=param("name");
$age=param("age");
$dbh=DBI->connect('DBI:mysql:prog3',"cs7a2","cs7123")
or die "error connect:DBI->errstr()";
$res=$con->prepare("create table if not exists student(name varchar(45), age int)");
$res->execute() or die("Error in creation");
$res=$con->prepare("insert into student values('$nam','$age')");
$res->execute();
$res=$con->prepare("select * from student");
$res->execute();

print header;
print start_html(
    -head => [
      Link( { -href => 'styles.css', -rel => 'stylesheet', -type => 'text/css'}),
    ]);
print "<div class=\"container\">
        <div class=\"box-cont\">
            <div class=\"box-header\" style=\"text-align:center;\">
                STUDENT DATABASE
            </div>
            <div class=\"box\">";
    print "<center><table class=\"ntable\">";
    print "<tr><th>NAME</th><th>AGE</th></tr>";
        while(@a=$res->fetchrow_array())
        {
            print "<tr><td>$a[0]</td><td>$a[1]</td></tr>";
        }
    print "</table></center>";
$res->finish();
$con->disconnect();
print "</div>
         </div>
        </div>";
print end_html( );
