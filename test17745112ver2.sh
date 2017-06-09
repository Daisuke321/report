#!/bin/bash

tmp=/tmp/$$

ERROR_EXIT(){
 echo "$1" >&2
 rm -f $tmp-*
 exit 1
}

#message list
echo "bad request" > $tmp-ans1
echo "bad request" > $tmp-ans2
echo "bad request" > $tmp-ans3
echo "bad request" > $tmp-ans4
echo "hi,input natural two numbers" > $tmp-ans5


# TEST1
./17745112.sh 10 2> $tmp-ten && ERROR_EXIT "TEST1-1"
diff $tmp-ans1 $tmp-ten || ERROR_EXIT "TEST1-2"

# TEST2
./17745112.sh 3.5 3 > $tmp-point && ERROR_EXIT "TEST2-1"
diff $tmp-point $tmp-ans2 || ERROR_EXIT "TEST2-2"

# TEST3
./17745112.sh 0 0.5 > $tmp-zero && ERROR_EXIT "TEST3-1"
diff $tmp-zero $tmp-ans3 || ERROR_EXIT "TEST3-2"

# TEST4
./17745112.sh 10 15 50 > $tmp-three && ERROR_EXIT "TEST4-1"
diff $tmp-three $tmp-ans4 || ERROR_EXIT "TEST4-2"

# TEST5
./17745112.sh 100 50 > $tmp-finish || ERROR_EXIT "TEST5-1"
diff $tmp-finish $tmp-ans5 || ERROR_EXIT "TEST5-2"
diff $tmp-finish $tmp-ans5 && echo "TEST5 FINE"

echo "ok"
rm -f $tmp-*
exit 0

