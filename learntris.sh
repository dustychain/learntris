#!/bin/bash

{
score=0
cleared=0
rot=0
xpos=3
ypos=0
offset=3 #spawn offset

# setup the matrix cell[]
counter=0
while [ $counter -lt 220 ]
do
    cell[${counter}]="."
    counter=`expr $counter + 1`
done

#O tetramino
otet[0]="y";otet[1]="y"
otet[2]="y";otet[3]="y"

}

function rot {
  case $1 in
    "L")
      case $rot in
        0)
          ltet[0]="" ;ltet[1]="" ;ltet[2]="o"
          ltet[3]="o";ltet[4]="o";ltet[5]="o"
          ltet[6]="" ;ltet[7]="" ;ltet[8]=""
          ;;
        1)
          ltet[0]="" ;ltet[1]="o";ltet[2]=""
          ltet[3]="" ;ltet[4]="o";ltet[5]=""
          ltet[6]="" ;ltet[7]="o";ltet[8]="o"
          ;;
        2)
          ltet[0]="" ;ltet[1]="" ;ltet[2]=""
          ltet[3]="o";ltet[4]="o";ltet[5]="o"
          ltet[6]="o";ltet[7]="" ;ltet[8]=""
          ;;
        3)
          ltet[0]="o";ltet[1]="o";ltet[2]=""
          ltet[3]="" ;ltet[4]="o";ltet[5]=""
          ltet[6]="" ;ltet[7]="o";ltet[8]=""
          ;;
      esac
      ;;
    "J")
      case $rot in
        0)
          jtet[0]="b" ;jtet[1]="" ;jtet[2]=""
          jtet[3]="b";jtet[4]="b";jtet[5]="b"
          jtet[6]="" ;jtet[7]="" ;jtet[8]=""
          ;;
        1)
          jtet[0]="" ;jtet[1]="b";jtet[2]="b"
          jtet[3]="" ;jtet[4]="b";jtet[5]=""
          jtet[6]="" ;jtet[7]="b";jtet[8]=""
          ;;
        2)
          jtet[0]="" ;jtet[1]="" ;jtet[2]=""
          jtet[3]="b";jtet[4]="b";jtet[5]="b"
          jtet[6]="";jtet[7]="" ;jtet[8]="b"
          ;;
        3)
          jtet[0]="";jtet[1]="b";jtet[2]=""
          jtet[3]="" ;jtet[4]="b";jtet[5]=""
          jtet[6]="b" ;jtet[7]="b";jtet[8]=""
          ;;
      esac
      ;;
    "Z")
      case $rot in
        0)
          ztet[0]="r" ;ztet[1]="r" ;ztet[2]=""
          ztet[3]="";ztet[4]="r";ztet[5]="r"
          ztet[6]="" ;ztet[7]="" ;ztet[8]=""
          ;;
        1)
          ztet[0]="" ;ztet[1]="";ztet[2]="r"
          ztet[3]="" ;ztet[4]="r";ztet[5]="r"
          ztet[6]="" ;ztet[7]="r";ztet[8]=""
          ;;
        2)
          ztet[0]="" ;ztet[1]="" ;ztet[2]=""
          ztet[3]="r";ztet[4]="r";ztet[5]=""
          ztet[6]="";ztet[7]="r" ;ztet[8]="r"
          ;;
        3)
          ztet[0]="";ztet[1]="r";ztet[2]=""
          ztet[3]="r" ;ztet[4]="r";ztet[5]=""
          ztet[6]="r" ;ztet[7]="";ztet[8]=""
          ;;
      esac
      ;;
    "S")
      case $rot in
        0)
          stet[0]="" ;stet[1]="g" ;stet[2]="g"
          stet[3]="g";stet[4]="g";stet[5]=""
          stet[6]="" ;stet[7]="" ;stet[8]=""
          ;;
        1)
          stet[0]="" ;stet[1]="g";stet[2]=""
          stet[3]="" ;stet[4]="g";stet[5]="g"
          stet[6]="" ;stet[7]="";stet[8]="g"
          ;;
        2)
          stet[0]="" ;stet[1]="" ;stet[2]=""
          stet[3]="";stet[4]="g";stet[5]="g"
          stet[6]="g";stet[7]="g" ;stet[8]=""
          ;;
        3)
          stet[0]="g";stet[1]="";stet[2]=""
          stet[3]="g" ;stet[4]="g";stet[5]=""
          stet[6]="" ;stet[7]="g";stet[8]=""
          ;;
      esac
      ;;
    "I")
      case $rot in
        0)
          itet[0]=""  ;itet[1]=""  ;itet[2]=""  ;itet[3]=""
          itet[4]="c"  ;itet[5]="c"  ;itet[6]="c"  ;itet[7]="c" 
          itet[8]=""  ;itet[9]=""  ;itet[10]="" ;itet[11]="" 
          itet[12]="" ;itet[13]="" ;itet[14]="" ;itet[15]="" 
          ;;
        1)
          itet[0]=""  ;itet[1]=""  ;itet[2]="c"  ;itet[3]=""
          itet[4]=""  ;itet[5]=""  ;itet[6]="c"  ;itet[7]="" 
          itet[8]=""  ;itet[9]=""  ;itet[10]="c" ;itet[11]="" 
          itet[12]="" ;itet[13]="" ;itet[14]="c" ;itet[15]="" 
          ;;
        2)
          itet[0]=""  ;itet[1]=""  ;itet[2]=""  ;itet[3]=""
          itet[4]=""  ;itet[5]=""  ;itet[6]=""  ;itet[7]="" 
          itet[8]="c"  ;itet[9]="c"  ;itet[10]="c" ;itet[11]="c" 
          itet[12]="" ;itet[13]="" ;itet[14]="" ;itet[15]="" 
          ;;
        3)
          itet[0]=""  ;itet[1]="c"  ;itet[2]=""  ;itet[3]=""
          itet[4]=""  ;itet[5]="c"  ;itet[6]=""  ;itet[7]="" 
          itet[8]=""  ;itet[9]="c"  ;itet[10]="" ;itet[11]="" 
          itet[12]="" ;itet[13]="c" ;itet[14]="" ;itet[15]="" 
          ;;
      esac
      ;;
    "T")
      case $rot in
        0)
          ttet[0]="" ;ttet[1]="m" ;ttet[2]=""
          ttet[3]="m";ttet[4]="m";ttet[5]="m"
          ttet[6]="" ;ttet[7]="" ;ttet[8]=""
          ;;
        1)
          ttet[0]="" ;ttet[1]="m";ttet[2]=""
          ttet[3]="" ;ttet[4]="m";ttet[5]="m"
          ttet[6]="" ;ttet[7]="m";ttet[8]=""
          ;;
        2)
          ttet[0]="" ;ttet[1]="" ;ttet[2]=""
          ttet[3]="m";ttet[4]="m";ttet[5]="m"
          ttet[6]="";ttet[7]="m" ;ttet[8]=""
          ;;
        3)
          ttet[0]="";ttet[1]="m";ttet[2]=""
          ttet[3]="m" ;ttet[4]="m";ttet[5]=""
          ttet[6]="" ;ttet[7]="m";ttet[8]=""
          ;;
      esac
      ;;
  esac
}

function activate {
  #first reset cell[]
  counter=0
  while [ $counter -lt 220 ]
  do
    cell[${counter}]="."
    counter=`expr $counter + 1`
  done
  #then activate
  case $1 in
    "I")
      active="I"
      rot I
      for i in 0 1 2 3 4 5 6 7 8 10 11 12 13 14 15
      do
        zeile=`expr $i / 4`
        zeile=`expr $zeile + $ypos`
        posi=`expr $i % 4`
        posi=`expr $posi + $xpos`
        temp5=`expr $zeile \* 10`
        if [ "${itet[$i]}" == "" ]
        then
          cell[`expr $temp5 + $posi`]="."
        else
          cell[`expr $temp5 + $posi`]=${itet[$i]}
        fi
      done
      ;;
    "O")
      active="O"
      for i in 4 5 14 15
      do
        cell[$i]="y"
      done
      ;;
    "Z")
      active="Z"
      rot Z
      for i in 0 1 2 3 4 5 6 7 8
      do
        zeile=`expr $i / 3`
        zeile=`expr $zeile + $ypos`
        posi=`expr $i % 3`
        posi=`expr $posi + $xpos`
        temp5=`expr $zeile \* 10`
        if [ "${ztet[$i]}" == "" ]
        then
          cell[`expr $temp5 + $posi`]="."
        else
          cell[`expr $temp5 + $posi`]=${ztet[$i]}
        fi
      done
      ;;
    "S")
      active="S"
      rot S
      for i in 0 1 2 3 4 5 6 7 8
      do
        zeile=`expr $i / 3`
        zeile=`expr $zeile + $ypos`
        posi=`expr $i % 3`
        posi=`expr $posi + $xpos`
        temp5=`expr $zeile \* 10`
        if [ "${stet[$i]}" == "" ]
        then
          cell[`expr $temp5 + $posi`]="."
        else
          cell[`expr $temp5 + $posi`]=${stet[$i]}
        fi
      done
      ;;
    "J")
      active="J"
      rot J
      for i in 0 1 2 3 4 5 6 7 8
      do
        zeile=`expr $i / 3`
        zeile=`expr $zeile + $ypos`
        posi=`expr $i % 3`
        posi=`expr $posi + $xpos`
        temp5=`expr $zeile \* 10`
        if [ "${jtet[$i]}" == "" ]
        then
          cell[`expr $temp5 + $posi`]="."
        else
          cell[`expr $temp5 + $posi`]=${jtet[$i]}
        fi
      done
      ;;
    "L")
      active="L"
      rot L
      for i in 0 1 2 3 4 5 6 7 8
      do
        zeile=`expr $i / 3`
        zeile=`expr $zeile + $ypos`
        posi=`expr $i % 3`
        posi=`expr $posi + $xpos`
        temp5=`expr $zeile \* 10`
        if [ "${ltet[$i]}" == "" ]
        then
          cell[`expr $temp5 + $posi`]="."
        else
          cell[`expr $temp5 + $posi`]=${ltet[$i]}
        fi
      done
      ;;
    "T")
      active="T"
      rot T
      for i in 0 1 2 3 4 5 6 7 8
      do
        zeile=`expr $i / 3`
        zeile=`expr $zeile + $ypos`
        posi=`expr $i % 3`
        posi=`expr $posi + $xpos`
        temp5=`expr $zeile \* 10`
        if [ "${ttet[$i]}" == "" ]
        then
          cell[`expr $temp5 + $posi`]="."
        else
          cell[`expr $temp5 + $posi`]=${ttet[$i]}
        fi
      done
      ;;
  esac
}

while [ "$input" != "q" ]
do
  read input
  for i in $input
  do
    for i2 in $i
    do
      for (( j=0; j<${#i2}; j++ ))
      do
        if [ ${i2:$j:1} == "?" ]
        then
          k="?"
        else
        k="${k}${i2:$j:1}"
          case "$k" in
              "p")
                for (( ce=0; ce<22; ce++ ))
                do
                  temp=`expr $ce \* 10`
                  for(( cel=0; cel<9; cel++ ))
                  do
                    printf "${cell[`expr $temp + $cel`]} "
                  done
                  printf "${cell[`expr $temp + $cel`]}\n"
                done
                ;;
              "g")
                  counter=0
                  while [ $counter -lt 220 ]
                  do
                      read input
                      for ce2 in $input
                      do
                        cell[${counter}]=$ce2
                        counter=`expr $counter + 1`
                      done
                  done
                  ;;
              "c")
                counter=0
                while [ $counter -lt 220 ]
                do
                  cell[${counter}]="."
                  counter=`expr $counter + 1`
                done
                ;;
              "?s")
                  printf "${score}\n"
                  ;;
              "?n")
                  printf "${cleared}\n"
                  ;;
              "s")
                for (( ce=0; ce<22; ce++ ))
                do
                  full=1
                  temp=`expr $ce \* 10`
                  for(( cel=0; cel<10; cel++ ))
                  do
                    if [ "${cell[`expr $temp + $cel`]}" == "." ]
                    then
                      full=0
                    fi
                  done
                  if [ $full -eq 1 ]
                  then      
                    counter=$temp
                    while [ $counter -lt `expr $temp + 10` ]
                    do
                      cell[${counter}]="."
                      counter=`expr $counter + 1`
                    done 
                    cleared=`expr $cleared + 1`
                    score=`expr $score + 100` 
                  fi
                done
                ;;
              "t")
                case "$active" in
                  "I")
                    for (( ce=0; ce<4; ce++ ))
                    do
                      temp=`expr $ce \* 4`
                      for(( cel=0; cel<3; cel++ ))
                      do
                        ch=${itet[`expr $temp + $cel`]}
                        if [ "$ch" == "" ]
                        then
                          printf ". "
                        else
                          printf "$ch "
                        fi
                      done
                      ch=${itet[`expr $temp + $cel`]}
                      if [ "$ch" == "" ]
                      then
                        printf ".\n"
                      else
                        printf "$ch\n"
                      fi
                    done
                    ;;
                  "O")
                    printf "y y\ny y\n"
                    ;;
                  "Z")
                    for (( ce=0; ce<3; ce++ ))
                    do
                      temp=`expr $ce \* 3`
                      for(( cel=0; cel<2; cel++ ))
                      do
                        ch=${ztet[`expr $temp + $cel`]}
                        if [ "$ch" == "" ]
                        then
                          printf ". "
                        else
                          printf "$ch "
                        fi
                      done
                      ch=${ztet[`expr $temp + $cel`]}
                      if [ "$ch" == "" ]
                      then
                        printf ".\n"
                      else
                        printf "$ch\n"
                      fi
                    done
                    ;;
                  "S")
                    for (( ce=0; ce<3; ce++ ))
                    do
                      temp=`expr $ce \* 3`
                      for(( cel=0; cel<2; cel++ ))
                      do
                        ch=${stet[`expr $temp + $cel`]}
                        if [ "$ch" == "" ]
                        then
                          printf ". "
                        else
                          printf "$ch "
                        fi
                      done
                      ch=${stet[`expr $temp + $cel`]}
                      if [ "$ch" == "" ]
                      then
                        printf ".\n"
                      else
                        printf "$ch\n"
                      fi
                    done
                    ;;
                  "J")
                    for (( ce=0; ce<3; ce++ ))
                    do
                      temp=`expr $ce \* 3`
                      for(( cel=0; cel<2; cel++ ))
                      do
                        ch=${jtet[`expr $temp + $cel`]}
                        if [ "$ch" == "" ]
                        then
                          printf ". "
                        else
                          printf "$ch "
                        fi
                      done
                      ch=${jtet[`expr $temp + $cel`]}
                      if [ "$ch" == "" ]
                      then
                        printf ".\n"
                      else
                        printf "$ch\n"
                      fi
                    done
                    ;;
                  "L")
                    for (( ce=0; ce<3; ce++ ))
                    do
                      temp=`expr $ce \* 3`
                      for(( cel=0; cel<2; cel++ ))
                      do
                        ch=${ltet[`expr $temp + $cel`]}
                        if [ "$ch" == "" ]
                        then
                          printf ". "
                        else
                          printf "$ch "
                        fi
                      done
                      ch=${ltet[`expr $temp + $cel`]}
                      if [ "$ch" == "" ]
                      then
                        printf ".\n"
                      else
                        printf "$ch\n"
                      fi
                    done
                    ;;
                  "T")
                    for (( ce=0; ce<3; ce++ ))
                    do
                      temp=`expr $ce \* 3`
                      for(( cel=0; cel<2; cel++ ))
                      do
                        ch=${ttet[`expr $temp + $cel`]}
                        if [ "$ch" == "" ]
                        then
                          printf ". "
                        else
                          printf "$ch "
                        fi
                      done
                      ch=${ttet[`expr $temp + $cel`]}
                      if [ "$ch" == "" ]
                      then
                        printf ".\n"
                      else
                        printf "$ch\n"
                      fi
                    done
                    ;;
                  *)
                    printf $active
                esac
                ;;
              "I")
                active="I"
                rot I
                activate "I"
                ;;
              "O")
                active="O"
                for i in 4 5 14 15
                do
                  cell[$i]="y"
                done
                ;;
              "Z")
                active="Z"
                rot Z
                activate "Z"
                ;;
              "S")
                active="S"
                rot S
                activate "S"
                ;;
              "J")
                active="J"
                rot J
                activate "J"
                ;;
              "L")
                active="L"
                rot L
                activate "L"
                ;;
              "T")
                active="T"
                rot T
                activate "T"
                ;;
              ")")
                temp=`expr $rot + 1`
                temp2=`expr $temp + 4`
                rot=`expr $temp2 % 4`
                rot $active
                ;;
              "(")
                temp=`expr $rot - 1`
                temp2=`expr $temp + 4`
                rot=`expr $temp2 % 4`
                rot $active
                ;;
              ";")
                printf "\n"
                ;;
              "P")
                for (( ce=0; ce<22; ce++ ))
                do
                  temp=`expr $ce \* 10`
                  for(( cel=0; cel<9; cel++ ))
                  do
                    temp2=`expr $temp + $cel`
                    printf `printf "${cell[$temp2]}" | awk '{print toupper($0)}'`
                    printf " "
                  done
                  printf `printf "${cell[$temp2]}" | awk '{print toupper($0)}'`
                  printf "\n"
                done
                ;;
              "<")
                temp=`expr $xpos - 1`
                if [ $temp -lt 1 ]
                then
                  xpos=1
                else
                  xpos=$temp
                fi
                activate $active
                ;;
              ">")
                temp=`expr $xpos + 1`
                if [ $temp -gt 8 ]
                then
                  if [ $rot -eq 3 ]
                  then
                    xpos=9
                    ttet[0]=". m"
                    ttet[1]="m m"
                    ttet[2]=". m"
                  fi
                else
                  xpos=$temp
                fi
                activate $active
                ;;
              "v")
                ypos=`expr $ypos + 1`
                if [ $ypos -gt 20 ]
                then
                  if [ `expr $rot % 2` -eq 0 ]
                  then
                    ypos=20
                  else
                    ypos=19
                  fi
                fi
                activate $active
                ;;
              "V")
                if [ `expr $rot % 2` -eq 0 ]
                then
                  ypos=20
                else
                  ypos=19
                fi
                ;;
              *)
                exit 1;
          esac
          k=""
        fi
      done
    done
  done
done
