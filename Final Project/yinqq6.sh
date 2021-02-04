######## Section 1 --------
# 1. Making a new directory
# check current directory 
pwd 

# change working directory
cd Desktop

# make a new directory 
mkdir test1

# 2. Creating new empty files 
touch "practice1.txt"
touch "practice2.txt"
touch "practice3.html"

# 3. Moving at least 1 of your created files to a new folder within your directory
mv practice1.txt practice2.txt test1

######## Section 2 --------
# 1. Download a txt file 

# 2. File information
# Name of the file: 1342-0.txt
# Link of the file: https://www.gutenberg.org/files/1342/1342-0.txt

# 3. Word count
cd test1
wc 1342-0.txt > count.txt

# 4. Head/tail
head -n 10 $"1342-0.txt" | tail -n 3 > head_tail.txt

# 5. For loop 
for filename in *.txt
do 
echo $filename 
head -n 10 $filename | tail -n 3 
done > for_loop.txt 

# 6. Grep statement 
grep -n "women" 1342-0.txt

######## Section 3 --------
# 1. Issues/struggles 
# In general, this course is very easy to follow.
# (1) I struggle to remember the syntax since there're so many. 
# (2) Some syntax are especially difficult to grasp. 
# For example, the -n -r -i. I always get confused with their usages. 
# When we add in pipes, the code gets complex and easy to get lost. 
# (3) I'm not sure how to incorporate this coding knowledge into my research or day-to-day coding tasks. 
# For example, how to manage the files with unix exactly in our real life? It'd be interesting to have a
# video to see how to use all of the commands to complete a project and see how it really flows.

# 2. When I get more familiar and comfortable with unix, I believe it could make my work more efficient. 
# Instead of manually looking for clues, I could use unix to maintain all of the muntane tasks.  

######## Thank you very much for the hard work. This lesson is excellent! --------
# Qinqin Yin, PhD in Economics
