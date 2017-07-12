
char* reverseString(char* s) {    
    if(!s)     
    {     
        return NULL;  
    }     
    int len = strlen(s);  
    char tmp;     
    for( int i = 0; i < len / 2; i++ )     
    {     
        tmp = *(s + i);     
        *(s + i) = *(s + len - 1 - i);     
        *(s + len - 1 - i) = tmp;
        /*
        tmp = s[i];
        s[i] = s[len - 1 -i];
        s[len - 1 - i] = tmp;
        */
    } 
    return s;
}
