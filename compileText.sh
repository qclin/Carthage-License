# example PLIST located in Resource/Plist directory
PLIST="${PROJECT_DIR}/Updraft/Resource/Plist/License.plist"
PLIST_BUDDY="/usr/libexec/PlistBuddy"

echo "${PROJECT_DIR}"

# check if Carthage is installed 
if [ -e "${PROJECT_DIR}/Carthage" ]; then
    echo "path exist"
else
    echo "directory doesn't exist yet"
    exit
fi

# check if Carthage has build
if [ -e "${PROJECT_DIR}/Carthage/Checkouts" ]; then
    echo "path exist"
else
    echo "directory doesn't exist yet"
    exit
fi

# Keys for Plist
LICENSE_KEY="License"
NAME_KEY="name"
BODY_KEY="text"
#Clearing and reseting plist for each build, avoid duplicates
$PLIST_BUDDY -c "DELETE :${LICENSE_KEY}" "${PLIST}"
$PLIST_BUDDY -c "ADD :${LICENSE_KEY} array" "${PLIST}"
# ls Checkout dir, split terminal logs by space and grabbing only the last element >> which is the name of the library
for dirlist in `ls -l "${PROJECT_DIR}/Carthage/Checkouts" | awk '$1 ~ /d/ {print $9 }'`
# loop through each library and create dictionary entry in pList with Name and Body key
do
    echo "$dirlist"
    if [ -e "${PROJECT_DIR}/Carthage/Checkouts/${dirlist}/LICENSE" ]; then
        # get LICENSE file and read file
        file="${PROJECT_DIR}/Carthage/Checkouts/${dirlist}/LICENSE"
        license=`cat $file`
        #insert dictionary item at the 0 index, PLIST doesn't have array.push 
        $PLIST_BUDDY -c "Add :${LICENSE_KEY}:0 dict" "${PLIST}"
        $PLIST_BUDDY -c "Add :${LICENSE_KEY}:0:${NAME_KEY} string ${dirlist}" "${PLIST}"
        # echo is required, else Plist will escape on \n newlines and \\ spaces, returning only the first line of string
        $PLIST_BUDDY -c "Add :${LICENSE_KEY}:0:${BODY_KEY} string `echo ${license}`" "${PLIST}"
    else
        echo "no license file"
    fi
done
