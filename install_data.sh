#!/bin/bash
echo "==================="
echo $WORK_PATH
echo $FILE_0
echo $FILE_1
echo $FILE_2
echo $MYSQL_ROOT_PASSWORD
echo "===================="
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF
source $WORK_PATH/$FILE_0;
EOF
echo "=========2=========="
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF
source $WORK_PATH/$FILE_1;
EOF
echo "=========3=========="
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF
source $WORK_PATH/$FILE_2;
EOF
echo "=========4=========="
