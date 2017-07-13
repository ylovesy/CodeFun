int hammingDistance(int x, int y) {
    //1.找出bit位不同的整数 2.算出这个整数有多少个1
    int z = x^y;
    int d = 0;
    while(z){
        ++d;
        z &= z-1;
    }
    return d;
}


