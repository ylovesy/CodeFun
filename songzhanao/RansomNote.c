bool canConstruct(char* ransomNote, char* magazine) {
    int i=0;
    int j=0;
    int temp=0;
    int rlen = strlen(ransomNote), mlen = strlen(magazine);
    for(i=0;i<rlen;i++){
        for(j=0;j<mlen;j++){
            if(ransomNote[i]==magazine[j]){
                magazine[j] = 1;
                temp++;
                break;
            }
        }
    }
    return (temp==rlen);
}
