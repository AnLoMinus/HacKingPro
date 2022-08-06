# Python3 program to validate
# domain name
# using regular expression
import re
import os

# Function to validate
# domain name.
def isValidDomain(str):

	# Regex to check valid
	# domain name.
	regex = "^((?!-)[A-Za-z0-9-]"+"{1,63}(?<!-)\\.)"+"+[A-Za-z]{2,6}"
	
	# Compile the ReGex
	p = re.compile(regex)

	# If the string is empty
	# return false
	if (str == None):
		print(0)

	# Return if the string
	# matched the ReGex
	if(re.search(p, str)):
		print(1)
	else:
		print(0)

str = os.environ.get("DOMAIN")
validate = isValidDomain(str)
