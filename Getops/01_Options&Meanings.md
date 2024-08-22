Let's go through the options, their full forms, and meanings, including >&2.

getopts Options:
-n:

Meaning: This option is used to specify a name.
In getopts: The n is followed by a colon (:) in ":n:m:h", which indicates that this option expects an argument (a value following the -n).
Example Usage: -n "Dileep" would set the Name variable to "Dileep".
-m:

Meaning: This option is used to specify a message.
In getopts: The m is followed by a colon (:), which means that this option also expects an argument.
Example Usage: -m "Hello" would set the Message variable to "Hello".
-h:

Meaning: This option is used to display the help message.
In getopts: The h is not followed by a colon, indicating that it does not require an argument. When -h is provided, the script shows the usage information and exits.
Example Usage: -h would display the help message.
: (colon):

Meaning in getopts: The colon after a letter in the getopts string (like n:) indicates that the option requires an argument.
Meaning in case of an error (within the script): If getopts encounters a missing argument for an option that expects one, it sets the option variable to : (colon), triggering the error handling code.
\?:

Meaning: This represents an unknown or invalid option. If a user passes an option that isn't recognized (e.g., -x when only -n, -m, and -h are valid), the script catches it and handles it appropriately.
$OPTARG:

Meaning: This variable holds the argument value provided for an option. For example, if the user specifies -n Dileep, $OPTARG will hold "Dileep" when processing the -n option.
Redirection: >&2
>&2:
Meaning: This redirects the output of the preceding command to the standard error (stderr) stream, instead of the standard output (stdout).
Why It's Used: Normally, messages are printed to stdout (the screen). However, error messages are often sent to stderr (which is a separate stream) so that they can be handled differently if needed (for example, logging errors separately from normal output).
Example in Script: echo "Invalid options: -"$OPTARG"" >&2 redirects the error message to stderr.
Summary:
-n: Option for specifying the name.
-m: Option for specifying the message.
-h: Option for displaying help.
:: Indicates that an option requires an argument.
\?: Handles invalid options.
$OPTARG: Holds the argument value provided for an option.
>&2: Redirects output to stderr, typically used for error messages.
In your script, >&2 is used to ensure that if an invalid option is provided, the error message is sent to stderr, which is a good practice in scripting.