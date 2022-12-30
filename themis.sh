#!/bin/sh

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y:G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@?. :Y@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@#!~~ 7^7&@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@B^!?~ 7J~~#@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@P^7??~ 7JJ7^P@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@J^7???~ 7J?J?^J@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@7^?????~ !J????^7&@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@#~~??????~ !J????J!~B@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@G^!???????~ !J?????J7^P@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@5^7????????~ !J??????J?^J@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@J^7?????????~ ~J?????????~!&@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@&7~???????????~ ~J?????????J!^B@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@#~~????????????~ ~J??????????J7^5@@@@@@@@@@@@@@
#@@@@@@@@@@@@G^!?????????????~ ~J???????????J?^?@@@@@@@@@@@@@
#@@@@@@@@@@@5^7??????????????~ ~J??????????????~!#@@@@@@@@@@@
#@@@@@@@@@@?^????????????????~ ^J??????????????J!^G@@@@@@@@@@
#@@@@@@@@&!~?????????????????~ ^J???????????????J?^Y@@@@@@@@@
#@@@@@@@B~!??????????????????~ ^J??????????????????^7@@@@@@@@
#@@@@@@G^7???????????????????~ ^JJJJ???????????????J!~#@@@@@@
#@@@@@Y^7???????????????77!~^:.:^~!77??JJJ??????????J7^G@@@@@
#@@@@?^??????????77!!~^^^~!7?YYYJ?!~~^^^~!7???JJJ????J?^Y@@@@
#@@&!~?????77!~~~~~!7?JY55555555555555YJ?7!~^^~~!7???JJJ~7&@@
#@B~!?7!!~~!!7?JY5555555555555555555555555555YJ?7!~~~~!7?!~B@
#P::::^~!77?????????????????????????????????????????7!~^::.:P
#BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB#BB
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
#############################################################
# (c) 2023, Dipl.-Inf. T. Bergmann - astares.com
#############################################################

# Find script context where we run 
SCRIPT_NAME=$0
SCRIPT=$(realpath -s "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

#************************************************************
# Utilities
#************************************************************
usage() { 
    echo "Usage: $SCRIPT_NAME [OPTIONS]\n" 1>&2;
    echo "Themis object server\n";
    echo "Options:\n"
    echo "\t-s\tsetup       - Setup the machine";
    echo "\t-b\tbootstrap   - Bootstrap with fresh data";
    echo "\t-c\tconnect     - Connect to the database";
    echo "\t-d\tdevelop     - load all necessary file for development";
    echo "\t-o\toperate     - operate the application";
    echo ""
    exit 1; 
}


setupMachine() {
    sudo -v
    sudo "$SCRIPTPATH/scripts/setup_machine.sh"
}

boostrapData() {
    echo "Bootstrap data";
    "$SCRIPTPATH/scripts/bootstrap_db.sh" $SCRIPTPATH 
}

connectToDatabase() {
    echo "connect";
}

downloadApplication() {
    "$SCRIPTPATH/scripts/download_pharo.sh" $SCRIPTPATH  
}

runApplication() {
    "$SCRIPTPATH/scripts/run_pharo.sh" $SCRIPTPATH  
}

#************************************************************
# Processing arguments
#************************************************************
while getopts ":p:sbcdorh" o; do
    case "${o}" in
        s) 
            setupMachine
            ;;
        b)
            boostrapData
            ;;    
        c)
            connectToDatabase
            ;;        
        d)  downloadApplication
            ;;
        r)  runApplication
            ;;    
        p)
            p=${OPTARG}
            ;;
        h)
            usage
            ;;
        *)  usage
            ;;
    esac
done
# Shift arguments to the left by the number of arguments 
# processed by getopts which allows to remove options and arguments 
# that have been processed from the list of arguments, so that we 
# can focus on the remaining arguments.
shift $((OPTIND-1))

#************************************************************
# Check for required parameters
#************************************************************
if [ "${p}" ]; then    
    usage;
    exit;
fi

# Download Pharo into a /build directory

