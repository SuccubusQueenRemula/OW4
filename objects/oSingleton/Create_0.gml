//Every singleton marks itself as the original on birth. 
//When a singleton finds another copy, it will mark this as false. 
//A singleton with a false value won't run the code to find other duplicates.
isOriginal = true;