#!/bin/bash

tmp=/tmp/$$

ERROR_EXIT(){
 echo "$1" >&2
 rm -f $tmp-*
 exit 1
}

# TEST1
echo "bad request" > $tmp-ans1
./17745112.sh 10 > $tmp-ten || ERROR_EXIT "TEST1-1"
diff $tmp-ans1 $tmp-ten || ERROR_EXIT "TEST1-2"
diff $tmp-ans1 $tmp-ten && echo "bad request"

# TEST2
echo "not natural numbers" > $tmp-ans2
./17745112.sh 3.5 3 > $tmp-point && ERROR_EXIT "TEST2-1"
diff $tmp-point $tmp-ans2 || ERROR_EXIT "TEST2-2"
diff $tmp-point $tmp-ans2 && echo "bad request"

# TEST3
echo "not natural numbers" > $tmp-ans3
./17745112.sh 0 0.5 > $tmp-zero && ERROR_EXIT "TEST3-1"
diff $tmp-zero $tmp-ans3 || ERROR_EXIT "TEST3-2"
diff $tmp-zero $tmp-ans3 && echo "bad request"

# TEST4
echo "bad request" > $tmp-ans4
./17745112.sh 10 15 50 > $tmp-three && ERROR_EXIT "TEST4-1"
diff $tmp-three $tmp-ans4 || ERROR_EXIT "TEST4-2"
diff $tmp-three $tmp-ans4 && echo "bad request"

# TEST5
echo "hi,input natural two numbers" > $tmp-ans5
./17745112 100 50 > $tmp-finish || ERROR_EXIT "TEST5-1"
diff $tmp-finish $tmp-ans5 || ERROR_EXIT "TEST5-2"
diff $tmp-finish $tmp-ans5 && echo "the GCD is :"

echo "ok"
rm -f $tmp-*
exit 0

