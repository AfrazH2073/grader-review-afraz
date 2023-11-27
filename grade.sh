CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests


cp -r student-submission/*.java ./grading-area
cp TestListExamples.java ./grading-area

cd grading-area
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > text.txt

files=`find student-submission/*.java`
for file in $files
do
    if [[ -f $file ]]
    then 
       java $file > text.txt
        grep -o "Failures: " text.txt
        echo "this works"
    else
        echo "incorrect path"
    fi

done