use v6.c;

use Date::Calendar::FrenchRevolutionary::Common;
use Date::Calendar::FrenchRevolutionary::Astronomical;
use Date::Calendar::FrenchRevolutionary::Arithmetic;

class    Date::Calendar::FrenchRevolutionary:ver<0.0.1>:auth<cpan:JFORGET>
    does Date::Calendar::FrenchRevolutionary::Common {

  method new-from-daycount(Int $count) {
    my ($y, $m, $d) = $.elems-from-daycount($count, &vnd1);
    $.new(year => $y, month => $m, day => $d);
  }

  our sub vnd1(Int:D $year-gr --> Int) {
    if $year-gr < 1811 {
      return Date::Calendar::FrenchRevolutionary::Astronomical::vnd1($year-gr);
    }
    else {
      return Date::Calendar::FrenchRevolutionary::Arithmetic::vnd1($year-gr);
    }
  }

}

=begin pod

=head1 NAME

Date::Calendar::FrenchRevolutionary - Conversions from / to the French Revolutionary calendar

=head1 SYNOPSIS

Converting from a Gregorian date to a French Revolutionary date

=begin code :lang<perl6>

use Date::Calendar::FrenchRevolutionary;
my Date                                $Bonaparte's-coup-gr .= new(1799, 11, 9);
my Date::Calendar::FrenchRevolutionary $Bonaparte's-coup-fr .= new-from-date($Bonaparte's-coup-gr);
say $Bonaparte's-coup-fr;

=end code

Converting from a  French Revolutionary date to a Gregorian date

=begin code :lang<perl6>

use Date::Calendar::FrenchRevolutionary;
my Date::Calendar::FrenchRevolutionary $Robespierre's-downfall-fr .= new(year    =>  2
                                                                       , month   => 11
                                                                       , day     =>  9);
my Date                                $Robespierre's-downfall-gr =  $Robespierre's-downfall-fr.to-date;
say $Robespierre's-downfall-gr;

=end code

=head1 DESCRIPTION

Date::Calendar::FrenchRevolutionary is  a class representing  dates in
the  French  Revolutionary  calendar.  It  allows  you  to  convert  a
Gregorian date into a French Revolutionary date or the other way.

The Revolutionary calendar was in use  in France from 24 November 1793
(4 Frimaire  II) to 31  December 1805 (10  Nivôse XIV). An  attempt to
apply  the decimal  rule  (the  basis of  the  metric  system) to  the
calendar. Therefore, the week disappeared,  replaced by the décade. In
addition, all months have exactly 3 decades, no more, no less.

Since 12 months of 30 days each do not make a full year (365.24 days),
there are 5 or 6 additional days at  the end of a year. These days are
called  "Sans-culottides", named  after  a political  faction, but  we
often find the phrase "jours complémentaires" (additional days). These
days do not  belong to any month, but for  programming purposes, it is
convenient to consider they form a 13th month.

At first,  the year was  beginning on the  equinox of autumn,  for two
reasons.  First, the  republic had  been established  on 22  September
1792, which  happened to be the  equinox, and second, the  equinox was
the symbol of equality, the day and the night lasting exactly 12 hours
each. It  was therefore  in tune with  the republic's  motto "Liberty,
Equality, Fraternity". But  it was not practical, so  Romme proposed a
leap year rule similar to the Gregorian calendar rule.

The distribution  contains two other  classes, one where there  was no
reform and the automn equinox rule stayed in effect, another where the
arithmetic rule was established since the beginning of the calendar.

=head1 AUTHOR

Jean Forget <JFORGET at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 Jean Forget, all rights reserved

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
