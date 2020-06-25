#!/bin/bash
#rm temp_stdout.txt temp_stderr.txt;
#node -p 'const FileSystem = require("fs"); const TTY = require("tty"); /*console.log("%o", process, process.stdout.isTTY);*/ FileSystem.writeSync(2, "something"); var stdout_stream = process.stdout; stdout_stream.write("Hello, stdout?", "utf8");' 1>temp_stdout.txt 2>temp_stderr.txt;
#echo "stdout: $(cat temp_stdout.txt) stderr: $(cat temp_stderr.txt)";
# env;
# echo $0 $SHELL;
# which node;
# tty;
# uname -a;
# whoami;
# declare -A test_results;
all_test_passed=1;
# Test: HelpData
test_name='HelpData';
test_results[$test_name]=0;
echo 'node source/main.js -Vhc';
node source/main.js -vVhc 1>temp_stdout.txt 2>temp_stderr.txt;
test_code=$?;
test_stdout=`cat temp_stdout.txt`;
test_stderr=`cat temp_stderr.txt`;
# rm temp_stdout.txt temp_stderr.txt;
if [[ $test_code ]]; then
	test_results[$test_name]=1;
	echo "Test: $test_name passed. (stdout: '$test_stdout' stderr: '$test_stderr')"; 
else
	test_results[$test_name]=0;
	echo "Test: $test_name failed with erroneous exit code $test_code (stderr: '$test_stderr')";
fi

# Test: InputRegexStringToSTDOUT
test_name='InputRegexStringToSTDOUT';
test_results[$test_name]=0;
node source/main.js -v --input-regex-string 'pcre/(simple)? regex/replace/vim' -o 1>temp_stdout.txt 2>temp_stderr.txt;
test_code=$?;
test_stdout=`cat temp_stdout.txt`;
test_stderr=`cat temp_stderr.txt`;
rm temp_stdout.txt temp_stderr.txt;
expected_stdout='\(simple\)\= regex';
if [[ $test_code ]]; then
	echo $test_stdout;
	if [[ "$test_stdout" == "$expected_stdout" ]]; then
		test_results[$test_name]=1;
		echo "Test: $test_name passed.";
	else
		test_results[$test_name]=0;
		echo "Test: $test_name failed: actual stdout: '$test_stdout' didn't match expected stdout: '$expected_stdout' (stderr: '$test_stderr')";
	fi
else
	test_results[help_data]=0;
	echo "Test: $test_name returned an erroneous exit code: $test_code stderr: '$test_stderr'";
fi

# Test: InputFileToOutputFile
# $1est_name='InputFileToOutputFile';
# $1est_results[$test_name]=0;
# $1cho ':([-0-9A-Za-z_ ]*)?:([0-9A-Za-z_]+)?:(([-0-9A-Za-z]+)(=([0-9A-Za-z]))?)?:(0|(([NIRBWAUFDnirbwaufd])[^!?=;]*([!?])(=(((\|)|(([-0-9A-Za-z_.\/\\ ]+)([!?])?)))+)?));' > temp_input.txt;
# $1cho $'node source/main.js -vx --input temp_input.txt --input-flavour \'pcre\' --output-flavour \'vim\' --output \'temp_output.txt\'';
# $1ode source/main.js -vx --input temp_input.txt --input-flavour 'pcre' --output-flavour 'vim' --output 'temp_output.txt' 1>temp_stdout.txt 2>temp_stderr.txt;
# $1est_code=$?;
# $1est_stdout=`cat temp_stdout.txt`;
# $1est_stderr=`cat temp_stderr.txt`;
# $1xpected_output_data=':\([-0-9A-Za-z_ ]*\)\=:\([0-9A-Za-z_]\+\)\=:\(\([-0-9A-Za-z]\+\)\(=\([0-9A-Za-z]\)\)\=\)\=:\(0\|\(\([NIRBWAUFDnirbwaufd]\)[^!\==;]*\([!\=]\)\(=\(\(\(|\)\|\(\([-0-9A-Za-z_.\/\\ ]\+\)\([!\=]\)\=\)\)\)\+\)\=\)\);\r';
# $1m temp_stdout.txt temp_stderr.txt;
# $1f [[ $test_code ]]; then
# $1output_data=`cat temp_output.txt`;

# $1lse
# $1test_results[$test_name]=0;
# $1echo "Test: $test_name failed with erroneous exit code $test_code (stderr: '$test_stderr')";
# $1i

exit 1;
