# Important commands you need to know: 
# awk, sed, less, tr, grep, cut, sort, cat

######## Hour 1: Shell Basics --------
# popular data filtering utilites
# cat : copy input to output 
# grep : search for strings in the input 
# sort : sort lines  in the input 
# cut : extract columns from input 
# sed : perform editing operations on input 
# tr : translate characters in the input to other characters

# Find bash version
bash --version

# Change prompt
# Color Options: 
# 0;30m:black / 0;31m:red /0;32m:green / 0;33m:brown / 0;34m:blue / 
# 0;35m:purple / 0;36m:cyan / 0;37m:light gray
# 1:30m: dark gray / 1;31m:light red /1;32m:light green / 1;33m:yellow / 
# 1;34m:light blue / 1;35m:light purple / 1;36m:light cyan / 1;37m: white 

# This changes prompt to # and color to blue
PS1="\[\033[0;34m\]# "

# send a file to printer 
ls file.txt 

# email a file contents
mail queenqueen89@gmail.com < file.txt 

# download a file
# format: 
curl -O 

# example: download txt file 
curl -O https://ia802701.us.archive.org/8/items/thestoriesmother05792gut/stmtn10.txt

# home directory shortcut 
cd ~ 
cd
cd ~/Desktop/test 

# wildcat matches 
[abc] : a b c or d
[.,;] : . , or ;
[_-] : _ or -
[a-c] : a b or c
[a-z] : all lowercase letters
[A-Z] : all uppercase letters
[!0-9] : all non digits
[0-9!] : all digits and !
[a-zA-Z] : all letters with any cases
[a-zA-Z0-9_-] : all letters with any cases all digits and - _

# other special signs: 
# ` : command substitution (archaic)
# ' : strong quote
# " weak quote (allow to execute some special signs, such as $)
 
# Brace expansion
# example 1:
echo b{ed,olt,ar}s
# this prints out: 
beds bolts bars

# example 2: 
echo b{ar{d,n,k},ed}s
# this prints out: 
bards, barns, barks, beds

# example 3: 
echo {2..5}
# this prints out: 
2 3 4 5

# example 4: 
echo {d..h}
d e f g h

# Show the date 
date 
date +"%m-%d-%y"
date +'%m-%d-%y'

# Show computer uptime
uptime

# Shoe all users of the computer 
who 

# Show your computer name 
who am i 

# A list of commands: use ; They're executed separately 
date; who am i;

# print out words 
echo "hello world" 

# Look for help for a command:
man who
man ls

# copy a file 
# Method 1: 
cat file1.txt > file2.txt 

# Method 2: 
cp file1.txt file2.txt 

# see differences of two files:
diff file1.txt file2.txt
diff file1.txt file2.txt > diff.txt &          # let it run in background

# continuing lines: 
# Method 1: add \ at end of line (no space behind \)
echo the Caterpillar and alice \
loked at each other for some \
time in silence.

# Method 2: use ''
echo 'the Caterpillar and alice
loked at each other for some
time in silence.'

# Find all shortcut keys 
stty all

#### 2. emacs mode: enable edit command line 
# set emacs mode
set -o emacs 

# shortcut in emacs 
# (1) to move around
control-B : move cursor to the left letter
control-F : move cursor to the right letter

esc-B : move cursor to the left word
esc-F :  move cursor to the right word

control-A : move to beginning of line 
control-E : move to end of line 

control-P : move to previous (history) line of command
control-N : move to next (history) line of command

control-R : search backward
esc-< : move to first line of history list
esc-> : move to last line of history list

# (2) to delete
(delete: delete a letter to the left of cursor)
control-D : delete a letter to the right of cursor

esc-D : delete a word to the right of cursor (or control + W)
esc-delete: delete a word to the left of cursor

control + U: delete the entire line 
control-K : delete everything to the right of cursor

control-Y : retrive last item being deleted

# if you're in the mid of line, you can just hit return

# (3) to complete text: 
# tab once
tab 
# works for command name/function name/fulename/directory (unique names)

# tab again (similar: esc-?)
tab
tab
# it prints out possible names

# to clear the screen
control-L 

#### 3. alias: 
# (1) create a new name for command 
# example: 
alias search=grep       # no space in between = sign

search be file.txt

# (2) create a shorthand for a long command string
# example: alias for a re-set directory you often visit
alias cddesk='cd Desktop'

# example: alias for lower/upper case combi command string 
alis lf='ls -F'

# (3) other comand
alias     # gives a list of alias created
unalias   # removes any alias created

#### 4. options 
# Note: 
# turn on option 
set -o optionname 

# turn off option
set +o optionname

#### 5. Prompt name setup
# set prompt with current directory name
PS1="\w-> "

# set prompt to username 
PS1="\u-> "

#### 6.change permission 
# Note: syntax: 
chmod +x scriptname      # 3 levels: read(r), write(r),execute(x)

######## Hour 3: Working with Files --------
#### 1. List all files in a directory 
# List files in several columns (with types, folders end with /)
ls -F

# List files in one column
ls -l

# list all files including invisible ones 
ls -a

# list all files including invisible ones + show types (folders end with /)
ls -a -F

# Group options together.The code below are the same:
ls -aF
ls -Fa
ls -a -F

ls -l -a -F
ls -laF
ls -lFa
ls -Fal

#### 2. View content of files
# (BLM.rtf, election.rtf are on desktop)
# View full content of a file (print out the whole file content)
# view one file 
cat BLM.rtf

# view two files 
cat BLM.rtf election.rtf

# view head of a file
head BLM.rtf

# view head of two files 
head BLM.rtf election.rtf

# View full content and Number each line (including blank): use -n
cat -n BLM.rtf

# View full content and Number each line (excluding blank): use -b
cat -b BLM.rtf

#### 3. Count words/lines/characters
# Count number of words, lines, charas.
wc BLM.rtf
wc BLM.rtf election.rtf

# Count number of lines
wc -l BLM.rtf
wc -l BLM.rtf election.rtf

# Count number of words 
wc -w BLM.rtf
wc -w BLM.rtf election.rtf 

# Count number of chars.
wc -c BLM.rtf
wc -m BLM.rtf

# Combine Options 
wc -w -c BLM.rtf
wc -wc BLM.rtf
wc -cw BLM.rtf

#### 4. Copy files 
# Copy a file 
cp BLM.rtf BLM-copy.rtf

# Copy a file: interactive mode (ask y/n) 
cp -i BLM.rtf BLM-copy.rtf

# Copy files to a different directory
# copy the file from desktop to /Documents directory
cp BLM.rtf ../Documents

# copy the file from desktop to /test directory on desktop
cp BLM.rtf ./test

# copy multiple files to a directory 
cp BLM.rtf election.rtf ./test

#### 5. Rename a file 
# Rename a file 
mv BLM.rtf blm.rtf
mv -i BLM.rtf blm.rtf

#### 6. Remove Files
rm BLM.rtf 
rm BLM.rtf election.rtf 
rm -i BLM.rtf 

######## Hour 4: Working with Directories --------
#### 1. List files 
# list all .rtf files on desktop 
ls *.rtf

# list all files in Documents directory
ls ../Documents

# list only directory, not contents, use -d
ls -d ../Documents 

# Combine options 
ls -aFd ../Documents

#### 2. Making directories 
# make one/several directories 
mkdir test
mkdir test1 test2

# make a directory inside the created directory:-m gives permission, -p helps create parent directory
mkdir -m
mkdir -p parent/child 

#### 3.Copy directories 
# Copy a file to a different directory
cp -r BLM.rtf ./Documents 

# Copy a directory to another directory 
cp -r test ../Documents

# Copy multiple directories to another directory 
cp -r test test2 ../Documents

# Copy files and directories to another directory
cp -r BLM.rtf test ./test2

#### 4. Move directories
# move a file to a different directory 
mv BLM.rtf ./test2/test

# move multiple files to a different directory
mv BLM.rtf election.rtf ./test2/test

# move the file back to original directory
mv ./test2/test/BLM.rtf . 

# move a folder to another folder
mv test test2

#### 5. Remove directories 
# remove empty directories 
rmdir test
rmdir test1 test2 

# remove directories with files 
rm -r test
rm -r test1 test2 

######## Hour 5: Manipulating File Attributes --------
# File types: 
# - : regular file (.rtf, .txt and more) 
# l : symbolic link (like shortcut)
# c : character special  
# b : block special  (hard drives and removable media)
# p : named pipe 
# s : socket
# d : directory file 

#### 1.Find a file's type
# list the file type (regular file: type start with -)
ls -l BLM.rtf

# To find file type info about a directory, use -d (directory file: type start with d)
ls -ld ./test2

#### 2. Create symbolic link (ln for link, -s for symbol) 
ln -s BLM.rtf ./test2/blm-link.rtf
ls -l blm-link.rtf 

#### 3. Viewing Permissions
# Basic Permissions 
# r : read (can only view contents)
# w : write (can alter contents)
# x : execute (can run the file)
 
# list permissions of a file 
ls -l BLM.rtf 
# Result: -rw-r--r--@
# 1st block: -rw: permissions for owner of the file, can read and write
# 2nd block: -r: permissions for group of the file, can read only
# 3rd block: -r: permissions for all other uses, can read only 


---skipped---



######## Hour 6: Processes --------
#### 1. Background Processes 
# add & in the end, so that it processes in background if too many files  
ls *.rtf &
set -o monitor           # if want to monitor the process 
set +o monitor           # to disable monitoring
# (then hit enter)


#### 2. Shoe all processes you're running
# general info  
ps 

# show full info 
ps -f

# show info about all users
ps -a

# show info about processes without terminals
ps -x

# show additional info (like ps -f)
ps -u 

#### 3. Kill a process 
# kill job number 1
kill %1

######## Hour 7: Variables --------
#### 1. Variable Names
# Valid names
_Fruit
fruit_basket
trust_no_1
two_times_2

# Invalid name (-, *, !, have special meaning in shell) 
2_times_2
FRUIT-BASKET
_2*2
TRUST_NO_1!

# To fix the code above (variable name can't start with number)
_2_times_2

#### 2. Variable values 
# one value only (no space between = sign)
FRUIT=peach
FRUIT=2apples
FRUIT=apple+pear+kiwi

# multiple values
fruit="apple orange plum"

#### 3. Access variable value 
echo $fruit 

#### 4. Array variables 
# Method 1
FRUIT[0]=apple
FRUIT[1]=banana
FRUIT[2]=orange

# Method 2
FRUIT_0=apple
FRUIT_1=banana
FRUIT_2=orange

# Method 3
FRUIT=(apple banana orange)

#### 5. access array values 
# Access one of the value 
echo ${FRUIT[0]}    # the first variable default is 0
echo ${FRUIT[2]}

# access all values 
echo ${FRUIT[*]} 
echo ${FRUIT[@]}

#### 6. Read-only variables (prevent overwrite the value)
fruit=kiwi 
readonly fruit
echo $fruit
fruit=cantaloupe   # shows read only
 
#### 7. Unset variables (fruit isn't a variable anymore)
unset fruit (cannot unset read-only variables)

######## Hour 8: Substitution --------
#### 1. Filename substitution: use *
# Note: 
# * : matches zero or more occurrences of any character
# ? : matches one occurrence of any character 

# List all files  
ls * 
ls -a 

# match file prefix 
ls ch*   # for example, list ch1 ch2 ch3, etc

# match file suffix 
ls *.doc  # for example, a.doc, b.doc, c.doc, etc

ls *m.txt   # for example, m.txt, lm.txt, km.txt

# match suffix and prefix 
ls B*rtf 

# use * twice to match a file 
ls BLM*file*rtf    # if the file name is BLM_file_2021.rtf

#### 2. File substitution: use ? 
# match exactly one character
ls ch0?.doc  # for example, ch01.doc, ch02.doc, etc

# match exactly two characters 
ls ch??.doc   # for exampple, ch11.doc, ch01.doc, etc 

# if use this, it gives a lot more matches 
ls ch0*.doc   # can be ch011.doc, ch01.doc, ch01111.doc, etc

#### 3. Matching sets of characters 
# Method 1: 
ls ch0[0123456789].doc   # lists ch01.doc, ch02.doc, etc

# Method 2: 
ls ch0[0-9].doc 

# match letters: lists all the files starting with a lowercase letter 
ls [a-z]*

# match lettes: lists all the files starting with a uppercase letter
ls [A-Z]*

# match letters: matches all files that start with a letter
ls [a-zA-Z]*        # you can see a-z and A-Z

# match letters: matches all files ending with a letter or a number 
ls *[a-zA-Z0-9]     # you can see a-z, A-Z, and 0-9

#### 4. Negating a set 
# select a list of files, except those that contain small letter a
# Method 1: Specify all the characters you want a filename to contain
ls [b-zA-Z0-9]*

# Method 2: use ! to exclude the letters
# ls [!a]*    # exclude letter a 
# ls [!ab]*   # exclude letter a and b

#### 5. Variable substitution 
# Notes: 
# (1) {parameter:-word}: If parameter is null or unset, word is substituted 
# for parameter. The value of parameter does not change. 
# (2) {parameter:=word}: If parameter is null or unset, 
# parameter is set to the value of word.
# (3) {parameter:?message}: If parameter is null or unset, message is printed 
# to standard error. This checks that variables are set correctly.
# (4) {parameter:+word}: If parameter is set, word is substituted for 
# parameter. The value of parameter does not change.  

--- skipped --- 

#### 6. Command substitution 
# Assign command date to DATE
DATE='date'

# Assign command who to USERS
USERS='who | wc -l' 

#### 7. Arithmetic substitution 
foo=$(( ((5 + 3*2) - 4) / 2 ))   # need ()outside the who equation
echo $foo    # print out result 

######## Hour 9: Quoting --------
# Note1: 
# Quoting with \ or ' or " 

# Note2: 
# A list of special characters: * ? [ ] ' " \ $ ; & ( ) | ^ < >

#### 1. Quoting with \
# \ enables to display it sa literal character 
echo Hello\; world    # it print out: Hello; world
echo you owe \$120    # because $ is special sign, add \ to print out $ as character

#### 2. Quoting with '
# Quotes with many special signs
echo '<-$1250.**>; (update?) [y|n]'     # use ' ' 

# Quotes with ' inside
# Method 1: use "" if has ' sign in it
echo "it's Friday"     

# Method 2: add \ in front of ' sign
echo it\'s Friday

#### 3. Qupting with "
# Note1: 
# Single quotes prevent variable substitution & prevent command substitution 
# All special characters between these quotes lose their special meaning.

# Note2: 
# Double quotes take away the special meaning of all characters except the following: 
# $ for parameter substitution.
# Backquotes for command substitution.
# \$ to enable literal dollar signs.
# \ ́ to enable literal backquotes.
# \" to enable embedded double quotes.
# \\ to enable embedded backslashes.

# Note3: 
# Any character immediately following \ become literal (not special).

# If use ' ' with many special signs: 
echo '$USER owes <-$1250.**>; [ as of ( ́date +%m/%d ́) ]'
# this prints out 
$USER owes <-$1250.**>; [ as of ( ́date +%m/%d ́) ]
# where no commands were executed 

# If use " " with many special signs: 
echo '$USER owes <-\$1250.**>;
# this prints out 
nicoleyin88 owes <-1250.**>;
# since it executes command $USER

#### 4. Quoting ignores word boundaries 
# To print out: Hello; world
# Method 1: 
echo "Hello; world" 

# Method 2: 
echo Hel"lo; w"orld    # as long as special sign ; is inside " "

# Combine quoting in commands 
echo The '$USER' variable contains this value \> "|$USER|"
# it prints out: 
The $USER variable contains this value > |nicoleyin88|

#### 5. Quote new lines 
# put \ in the end to start a new line (without space behind \)
ls cde.doc \
code.sh BLM.trf

# print with new lines 
echo 'line 1
line 2
line 3'
# this prints out: 
line 1
line 2
line 3

#### 6. Quoting to Access Filenames Containing Special Characters
# Note: pay attention to files that contain special signs: ? * []

# remove file named ch1*
rm 'ch1*' 

#### 7. Escape sequence \n (add extra line)
# jump to next line 
echo -e "Line 1\nLine 2"     
# it prints out: 
Line1 
Line2

# create 3 extra blank lines 
echo -e "line 1\n\n\n\nLine 2"
# it prints out: 
Line1



Line2

######## Hour 10: Flow Control --------
# Notes: 
# 2 powerful flow control: if statement & case statement 

#### 1. if statement 
# if statement syntax: 
# Method 1
# if...then, elif...then, else...fi
if list1
then 
	list2
elif list3
then
	list4
else
	list5
fi

# Method 2
if list1 ; then list2 ; elif list3 ; then list4 ; else list5 ; fi ;

# example 
if uuencode report1.doc report1.doc > x.doc; then
	echo "Encoded report1.doc to x.doc"
else
	echo "Error" 
fi 

#### 2. check empty/nonempty string 
# Notes: 
# (1) -z string : true if string has zero length
# (2) -n string : true if string has nonzero length 
# (3) string1 = string2 : true if strings are equal 
# (4) string1 != string2 : true if strings are not equal  

# check whether a string is empty 
fruit="orange apple banana"     # create a string 
if [ -z "$fruit" ] ; then
echo "Your fruit basket is empty" ;           # since -z means zero length, must print empty 
else 
echo "Your fruit basket has the following fruit: $fruit"
fi
# below is the output: 
Your fruit basket has the following fruit: orange apple banana

# check whether a string is nonempty
fruit="orange apple banana"     # create a string
if [ -n "$fruit" ] ; then
echo "Your fruit basket has the following fruit: $fruit";           # since -n means nonzero length, must print results
else
echo "Your fruit basket is empty" ;
fi
# below is the output:
Your fruit basket has the following fruit: orange apple banana

#### 3. Check whether 2 strings are equal/not equal
# check whether equal 
fruit="banana" 
if [ "$fruit" = apple ] ; then
	echo "An apple a day keeps the doctor away."
else 
	echo "You must like doctors, your fruit $fruit is not an apple."
fi 
# it prints out: 
You must like doctors, your fruit $fruit is not an apple.

# check whether not equal 
fruit="banana"
if [ "$fruit" != apple ] ; then
	echo "You must like doctors, your fruit $fruit is not an apple."
else
	echo "An apple a day keeps the doctor away."
fi 

#### 4. case statement: match string with pattern
# Note: 
# case statement has the form: 
case word in 
	pattern1)
		list1
		;; 
	pattern2)
		list2
		;; 
esac

# example: 
fruit=kiwi
case "$fruit" in
	apple) 
		echo "Apple pie is quite tasty." 
		;;
	banana) 
		echo "I like banana nut bread." 
		;;
	kiwi) 
		echo "New Zealand is famous for kiwi." 
		;;
esac
# case statement: not only simplify if statement, also uses patterns to 
# perform matching

######## Hour 11: Loops --------
# Note: 
# (1) while loop enables you to execute a set of commands repeatedly until some condition 
# occurs. It is usually used when you need to manipulate the value of a variable repeatedly.

# (2) for loop enables you to execute a set of commands repeatedly for each item in a 
# list. One of its most common uses is in performing the same set of commands for a large number of files.

#### 1. While loop 
# (1) Basic while loop format
# Method 1: 
while command 
do
	list
done

# Method 2: 
while command ; do list ; done

# Notes: 
# -eq : equal to
# -ne : not equal to 
# -gt : greater than 
# -lt : less than 
# -ge : greater than or equal to
# -le : less than or equal to 

# while loop example
i=0
while [ $i -le 5 ]       # print out i when less than or equal 5 (le: less than or equal to)
do
	echo $i
	i=`expr $i + 1`
done
# it prints out: 
0
1
2
3
4
5

# (2) Nesting while loops 
# nesting while loop format: 
while command1 ;            # this is loop1, the outer loop
do
    list1
    while command2 ;         # this is loop2, the inner loop
    do
	list2 
    done
    list3 
done

# example: 
a=0
while [ "$a" -lt 10 ]   	 # this is loop1
do
   b="$a"
   while [ "$b" -ge 0 ]  	 # this is loop2
   do
      echo -n "$b "
      b=`expr $b - 1`
   done
   echo
   a=`expr $a + 1`
done
# this prints out: 
0
1 0
2 1 0
3 2 1 0
4 3 2 1 0
5 4 3 2 1 0
6 5 4 3 2 1 0
7 6 5 4 3 2 1 0
8 7 6 5 4 3 2 1 0
9 8 7 6 5 4 3 2 1 0

# (3) Compare until loop with while loop: 
x=1;
until [ $x -ge 10 ]
do
	echo $x
	x=`expr $x + 1`
done
# this print out: 
1
2
3
4
5
6
7
8
9
#this is the same as: 
x=1
while [ ! $x -ge 10 ]
do
	echo $x
	x=`expr $x + 1`
done

#### 2. for loops 
# Note: 
# for loop syntax: 
# Method 1: 
for name in word1 word2 ... wordN 
do
	list
done

# Method 2: 
for name in word1 word2 ... wordN ; do list ; done

# example: 
for i in 0 1 2 3 4 5
do
echo $i 
done
# this prints out all numbers together: 
0
1
2
3
4
5

# example: 
for i in 0 1 2 3 5 4 
do
echo $i 
done
# this prints out all numbers together:
0
1
2
3
5
4

# example: 
for filename in *.doc
do
cp $filename original-$filename
done

#### 3. select loops 
# Note: 
# select loop syntax: 
select name in word1 word2 ... wordN 
do
	list
done

######## Hour 13: Input/output --------
#### 1. Escape sequences for printf 
# Notes: 
# \n : print a newline character
# \t : print a tab character
# \c : print a string w/out default trailing newline

# example: 
FRUIT_BASKET="apple orange pear"
printf "Your fruit basket contains:\n\n$FRUIT_BASKET"
# it prints out: 
Your fruit basket contains:

apple orange pear# 

# example 
printf "Is that a mango?\n\n"
# it prints out: 
Is that a mango?


#### 2. Append to a file
# Note: 
# format: 
command >> file 

# example: print output to a newly created file mylog 
{ date; uptime; who ; } > mylog 
# this prints out date, uptime, who, in a new file named mylog

# example: append output to the file mylog
# in this case, date, uptime, who shows up twice in the file mylog

# example: append a variable to the file mylog 
fruit="apple banana"
echo $fruit >> mylog
# apple banana will appear at end of the mylog file 

#### 3. Input redirection 
# Note: 
# syntax:
command < file 

# (1) email file content
mail queenqueen89@gmail.com < BLM.rtf      # find in Spams, it emails contents
 
######## Hour 15: Text Filters --------
# Note: 
# text filters include: head/tail/grep/sort/uniq/tr

#### 1. head command 
# note: 
# head syntax: 
head -n #lines files

# example 
ls -l | head -5
ls -lut | head -5       # list 5 most recently accessed files

#### 2. tail command 
ls -l | tail -5
ls -lt | tail -5        # list last modified files, from newest to oldest 
ls -lrt | tail -5	# list last modified files, from oldest to newest

#### 3. grep command 
# Note: 
# grep syntax 
grep word_to_grab file_name     

# (1) example (1 file): 
grep cat a.txt        # since words that contain "cat" only has cat
# it prints out: 
What is the cat.

# example (1 file):
grep a a.txt          # since multiple words contain "a" 
# it prints out: 
a 
Cat
Jack 
This is the most important. 
What
What is the cat.

# example (multiple files):
grep pipe a.txt b.txt 
# it prints out: 
b.txt:this is the most important pipe

# (2) match cases 
grep cat b.txt    # this gives word only match "cat", all lowercase
grep CAT b.txt    # this gives word only match "CAT", all uppercase
grep -i cat b.txt   # this give word match all cases, can be "caT" too

# (3) read from standard input 
who | grep nicole 

# (4) grab without the words 
grep -v cat b.txt    # this prints out all words that exclude "cat" (all lowercase)
grep -vi cat b.txt   # this prints out all words that exclude "cat" (in any cases)

# (5) grab words and number the line
grep -n cat a.txt b.txt 

# (6) grab all files that contain the word "love" 
grep -l love *

#### 4. tr command  
# Note: 
# To Count occurences of words, can use:
# (1) tr : ( tr for transliterate) changes all the characters in one 
# set into characters in a second set. Sometimes it deletes sets of characters. 
# (2) sort : sorts the lines in an input file. If you don't specify an input 
# file, it sorts the lines given on STDIN.
# (3) uniq : prints all the unique lines in a file. If a line occurs multiple 
# times, only one copy of the line is printed out. It can also list the number 
# of times a particular line was duplicated.

# (1) basic tr syntax form: 
tr 'set1' 'set2'

# example:prints out contents that exclude special symbols 
tr '!?":;\[\]{}(),.' ' ' < a.txt      

# example:prints out contents that exclude special symbols, no newline/tab 
tr '!?":;\[\]{}(),.\t\n' ' ' < a.txt   

# example: print out contents all in lowercase if there're combi cases 
tr '!?":;\[\]{}(),.\t\n' ' ' < b.txt | tr 'A-Z' 'a-z'
# it prints out: 
this is a cat   this is not a cat   cat is funny

# (2) squeeze out spaces 
# syntax: 
tr -s 'set1'

# example: 
# for occurrences of a character, tr replaces these with only one occurrence. 
echo "feed me" | tr -s 'e'
# it prints out: 
fed me 

# example: 
echo "Shell Programming" | tr -s 'lm'
# it prints out: 
Shel Programing

#### 5. sort command 
# example: use tr, change all space into new lines  
tr '!?":;\[\]{}(),.\t\n' ' ' < a.txt | tr  'A-Z' 'a-z' |  tr -s ' '| tr ' ' '\n'

# example: use sort, count of how many times each word is used
tr '!?":;\[\]{}(),.\t\n' ' ' < a.txt | tr 'A-Z' 'a-z' | tr -s ' '  | tr ' ' '\n' | sort 
# this prints out: 
is
is
is
jack
most
the
the
this
this

#### 6. uniq command 
# example: print out unique fruits
tr '!?":;\[\]{}(),.\t\n' ' ' < fruits.txt | tr 'A-Z' 'a-z' | tr -s ' '  | tr ' ' '\n' | sort | uniq

# example: print out unique fruits, and count occurences 
tr '!?":;\[\]{}(),.\t\n' ' ' < fruits.txt | tr 'A-Z' 'a-z' | tr -s ' '  | tr ' ' '\n' | sort | uniq -c
# it prints out: 
3 apple
1 banana
2 orange
3 peach

# example: print unique fruits, and order by occurences 
tr '!?":;\[\]{}(),.\t\n' ' ' < fruits.txt | tr 'A-Z' 'a-z' | tr -s ' '  | tr ' ' '\n' | sort | uniq -c | sort -rn 
# it prints out:  
3 peach
3 apple
2 orange
2 banana
1 kiwi
etc. 

# example: look at head of the results (top 10 most repeated words)
tr '!?":;\[\]{}(),.\t\n' ' ' < fruits.txt | tr 'A-Z' 'a-z' | tr -s ' '  | tr ' ' '\n' | sort | uniq -c | sort -rn | head
# it prints out: 
4 peach
4 kiwi
4 apple
2 orange
2 banana
1 strawberry
1 raspberry
1 plum
1 papaya
1 lychee

#### 7. Sorting Numbers in a Different Column
# syntax: 
sort -k start,end files

# example: 
# print out file content
cat file.txt
# it prints 
files 80
file 70
is 115
and 115 a 111
in 69
' 65
the 389
to 164
of 127

# sort the output by numbers
# Method 1: 
sort -rn -k 2,2 file.txt

# Method 2: 
sort -rn -k 2 file.txt      # since there're only 2 columns
# it prints out: 
the 389
to 164
of 127
is 115
and 115
a 111
files 80
file 70
in 69
' 65

#### 8. Using character classes with tr 
# tr command understood character classes below: 
# alnum: Letters and digits
# alpha: letters 
# blank: Horizontal whitespace
# cntrl: Control characters
# digit: Digits
# graph: Printable characters, not including spaces
# lower: Lowercase letters
# print: Printable characters, including spaces
# punct:Punctuation
# space: Horizontal or vertical whitespace
# upper: Uppercase letters
# xdigit: Hexadecimal digits 

# example: print head, top 10 most frequently used words
tr '[:punct:]' ' ' < election.rtf | tr '[:space:]' ' ' | tr 'A-Z' 'a-z' | tr -s ' ' | tr ' ' '\n' | sort | uniq -c | sort -rn | head
# 
it prints out: 
425 the
336 to
313 and
270 of
244 they
233 you
231 we
208 a
206 it
206 i

######## Hour 16: filter text using regular expressions --------
# 0. Note: 
# (1) Metacharacters Used in Regular Expressions: 
# . : Matches any single character except a newline.
# * : Matches zero or more occurrences of the character immediately preceding it.
# [chars] : Matches any one of the characters given in chars, where chars is a sequence of characters. You can use the - character to indicate a range of characters. If the ^ character is the first character in chars, one occurrence of any character that is not 
#           specified by chars is matched.
# ^ : Matches the beginning of a line.
# $ : Matches the end of a line.
# \ : Treats the character that immediately follows the \ literally. This is used to 
#     specify patterns that contain one of the preceding wildcards.

# (2) Examples 
/peach/ : matches exactly: peach
/a.c/ : matches lines that contain strings such as: a+c, a-c, abc, match, a3c 
/a*c/ : matches strings such as: ace, yacc, and arctic
/a*a/ : can match the whole string: able was I, ere I saw elba
/ch.*doc/ :can match: ch01.doc, ch02.doc, and chdoc
/ch[^0-9]/ : ^ is negate, match anything not number after "ch": chapter,chocolate (not ch01)
/ch0[0-9]*doc/ : can match: ch01.doc, ch02.doc (not: chdoc, changedoc)
/the/ : can match"the" or "there": "there were many orchards of fruit tree" 
	or "in the dark it was like summer lightning"
/the / : matches "the" only: "in the dark it was like summer lightning"
/^the /: matches "the" in the beginning of sentence: "the forest of oak trees on the mountain"
/friend$/: match only "friend" not "friends": "I have been and always will be your friend"
/^Chapter [1-9]*[0-9]$/ : can match: chapter 1, chapter 20 (not match: chapter 00 Introduction)
/^$/ : match empty line
/^.*$/ : match entire line
/ */ : match one or more spaces
/\$[0-9]*\.[0-9][0-9]/ : match dollar amounts
/[a-zA-Z][a-zA-Z]*:\/\/[a-zA-Z0-9][a-zA-Z0-9\.]*.*/    : match valid URLs 

/\$[0-9]*\.[0-9][0-9]\/[a-zA-Z]*/ : can be used to match: $0.89/lbs
# comment: since $ . / are special signs, need to use \ to characterize them. 
# here, we need to 
# match: $, use \$ 
# match 0: can be any digits, use [0-9]*
# match .: use \. 
# match 89: use [0-9][0-9] 
# match /: use \/ 
# match lbs: can be any letters, use [a-zA-Z]*
# the / / at both ends are for the awk argument-to match the specific words   

#### 1. awk command
# example 1: 
awk '{print}' employee.txt
# it prints out: (the whole context)
ajay		manager		account		45000
aunil		clerk		account		25000
aarun		manager		sales		50000
amit		manager		account		47000
tarun		peon		sales		15000
deepak		clerk		sales		23000
sunil		peon		sales		13000
satvik		director	purchase	80000

# Example 2: 
awk '/manager/ {print}' employee.txt
# it prints out: (any line that contains word “manager”)
ajay		manager	account		45000
varun		manager	sales		50000
amit		manager	account		47000

# Example 3: 
awk '{print $1,$4}' employee.txt
# it prints out: (the 1st and 4th columns)
jay	45000
sunil	25000
varun	50000
amit	47000
tarun 	15000
deepak  23000
sunil 	13000
satvik 	80000

# Example 4: 
awk '{print NR}' employee.txt
# it prints out: (number of each line)
1
2
3
4
5
6
7
8

# Example 5: 
awk '{print NR,$0}' employee.txt
# it prints out: (numbering each line & all content - $0 starts from col 0 – just print every column)
1 ajay		manager		account		45000
2 aunil		clerk		account		25000
3 aarun		manager		sales		50000
4 amit		manager		account		47000
5 tarun		peon		sales		15000
6 deepak	clerk		sales		23000
7 sunil		peon		sales		13000
8 satvik	director	purchase	80000

# Example 6: 
awk '{print NR,$1}' employee.txt
# it prints out: (numbering each line & contents of col 1)
1 ajay
2 aunil
3 aarun
4 amit
5 tarun
6 deepak
7 sunil
8 satvik

# Example 7: 
awk '{print $1,$NF}' employee.txt
# it prints out: (the 1st and last columns)
jay	45000
sunil	25000
varun	50000
amit	47000
tarun 	15000
deepak  23000
sunil 	13000
satvik 	80000

# Example 8:
awk 'NR==3, NR==6 {print NR,$0}' employee.txt
# it prints out: (line 3 through line 6)
3 varun		manager 	sales 		50000
4 amit 		manager 	account 	47000
5 tarun 	peon 		sales 		15000
6 deepak 	clerk 		sales 		23000

# Example 9: 
awk 'END {print NR}' employee.txt
# it prints out: (total number of lines)
8

# Example 10: 
awk '/a[cj]/ {print $0}' employee.txt
# it prints out: (any lines that contain “ac” or “aj”)
ajay	manager	account 45000
aunil 	clerk	account 25000
amit manager account 47000

# example 11: see whether the third field contains a value less than or equal to 75
awk '
$3 <= 75 { printf "%s\t%s\n",$0,"REORDER" ; }
$3 > 75 { print $0 ; }
' fruit_prices.txt
# it prints out: 
Fruit		Price/lbs       Quantity
Banana 		$0.89           	100
Peach		$0.79           	65      REORDER
Kiwi		$1.50           	22      REORDER
Pineapple	$1.29           	35      REORDER
Apple		$0.99           	78

2. sed command
# example 1: print a list of those fruits that cost less than $1 per pound
sed -n '/0\.[0-9][0-9]$/p' fruit_prices.txt
# it prints out: 
Fruit		Price/lbs
Banana		0.89
Paech		0.79
Apple		0.99

# Example 2: delete lines that follow a pattern and print 
Step 1: delete all lines that contain Mango or mango in fruit_prices.txt. (in this step, file isn’t modified)
sed '/^[Mm]ango/d' fruit_prices.txt
# it prints out: 
Fruit		Price/lbs
Banana		0.89
Paech		0.79
Kiwi		1.50
Pineapple	1.29
Apple		0.99

Step 2: rename the file – create temporary file 
($$ is the process ID of the current shell. Appending this value to the end of a file is a common practice for creating temporary files.)
mv fruit_prices.txt fruit_prices.txt.$$

Step 3: delete all lines that contain Mango or mango in fruit_prices.txt.$$
sed '/^[Mm]ango/d' fruit_prices.txt.$$ > fruit_prices.txt

Step 4: check the update in file fruit_prices.txt 
cat fruit_prices.txt	
# it prints out: (w/out mango or Mango)
Fruit		Price/lbs
Banana		0.89
Paech		0.79
Kiwi		1.50
Pineapple	1.29
Apple		0.99

Step 5: remove temporary file fruit_prices.txt.$$
rm fruit_prices.txt.$$

# example 3: substitute a pattern with another one
sed 's/Paech/Peach/' fruit_prices.txt
it prints out: 
Fruit		Price/lbs
Banana		0.89
Paech		0.79
Kiwi		1.50
Pineapple	1.29
Apple		0.99

mv fruit_prices.txt fruit_prices.txt.$$
sed 's/Paech/Peach/' fruit_prices.txt.$$ > fruit_prices.txt
cat fruit_prices.txt	
rm fruit_prices.txt.$$

# Example 4: global substitution (substitute for all)
sed 's/eqal/equal/g' nash.txt
# it prints out: 
things that are equal to the same thing are equal to each other

# example 5: reuse an expression – use “s” for substitution and “&” for reuse
# note: add $ in front of all prices 
sed 's/ *[0-9][0-9]*\.[0-9][0-9]$/\$&/' fruit_prices.txt
# it prints out: 
Fruit		Price/lbs
Banana		$0.89
Paech		$0.79
Kiwi		$1.50
Pineapple	$1.29
Apple		$0.99

# Example 6: combine commands
Step 1: substitute Paech with Peach, and add $ sign in front of all prices in file fruit_prices.txt
sed -e 's/Paech/Peach/' -e 's/ *[0-9][0-9]*\.[0-9][0-9]$/\$&/'
# it prints out: 
Fruit		Price/lbs
Banana		$0.89
Paech		$0.79
Kiwi		$1.50
Pineapple	$1.29
Apple		$0.99

Step 2: update the file 
mv fruit_pieces.txt fruit_pieces.txt.$$
sed -e 's/Paech/Peach/' -e 's/ *[0-9][0-9]*\.[0-9][0-9]$/\$&/' fruit_prices.txt.$$ > fruit_pieces.txt
cat fruit_pieces.txt
# it prints out: 
Fruit		Price/lbs
Banana		$0.89
Paech		$0.79
Kiwi		$1.50
Pineapple	$1.29
Apple		$0.99
rm fruit_prices.txt.$$
sed -e 's/Paech/Peach/' -e 's/ *[0-9][0-9]*\.[0-9][0-9]$/\$&/' fruit_prices.txt

# Example 7: in a pipeline 
/usr/bin/id
# Suppose it prints out:
uid=500(ranga) gid=100(users)

(1) to eliminate everything following the first parenthesis
/usr/bin/id | sed 's/(.*$//'
# it prints out: 
uid=500

(2) to eliminate everything following the first parenthesis, then delete word start with “uid”
/usr/bin/id | sed -e 's/(.*$//' -e 's/^uid=//'
# it prints out: 
500



