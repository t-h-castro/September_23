#!/usr/bin/perl
use strict;
use warnings;

# File: HW3_7_3.pl
# Author: Thomas Castro
# Date: 17 Sep 2022
#
# Assignment
#    Write a subroutine to randomly shuffle the elements of an array. The
#    subroutine should take an array as an argument and return an array with
#    the same elements but shuffled in a random order. Each element of the
#    original array should appear exactly once in the output array, just like
#    shuffling a deck of cards.
#
# Modified 'Inverse Shuffle' adapted from How Many Times Should You Shuffle
#    a Deck of Cards, Brad Mann, n.d.
#    https://chance.dartmouth.edu/teaching_aids/books_articles/Mann.pdf
#

srand(time||$$);                                    # set seed
my @a = qw( 1 2 3 4 5 6 7 8 9 A B C D E F );        # define array to shuffle

print "\n\nHomework 3, Exercise 7.3:  Shuffle an array\n\n";

print "         Array: ", join(" ", @a), "\n\n";    # print array

for (1..7) { @a = shuffle(@a); }                    # shuffle 7 times

print "Shuffled Array: ", join(" ", @a), "\n\n";    # print array

##################
# subroutines
##################

sub shuffle{

  my @array_to_suffle = @_;                           # pass argument to array
  my @left_pile = ();                                 # left pile
  my @right_pile = ();                                # right @left_pile
  my @shuffled = ();                                  # shuffled result

  foreach (@array_to_suffle) {                        # loop through elements

    if (rand > 0.5) {                                 # above 0.5 -> left pile
      # print $_, " above 0.5\n";
      if (rand > 0.5) {                               # on top of pile
        # print "   place on top of left pile\n";
        push(@left_pile, $_);
      } else {                                        # on bottom of pile
        # print "   place on bottom of left pile\n";
        unshift(@left_pile, $_);
      }

    } else {                                          # below 0.5 -> right pile

      # print $_, " below 0.5\n";
      if (rand > 0.5) {                               # on top of pile
        # print "   place on top of right pile\n";
        push(@right_pile, $_);
      } else {                                        # on bottom of pile
        # print "   place on bottom of right pile\n";
        unshift(@right_pile, $_);
      }

    }

  }

  # print "     Left Pile: ", @left_pile, "\n";
  # print "    Right Pile: ", @right_pile, "\n";

  @shuffled = (@left_pile, @right_pile);              # join to piles together

  return @shuffled;

}

exit;
