main(){
    printf ("Hello, World!!");
    int 2a = 2;
    int b# , d , e;
    b = a + 2;
    d = b / 10 - 4 * 20;
    b -= d;
    b = b & 1;
    float c@2 = 0; // this is inline comment
    c += 2.5;
    // this is a comment
    if ( c ){
        printf ("c is non-zero");
    }else{
        printf ("c is zero");
    }
    for(int i = 0;i < 10;i++){
        printf ("%d ",i);
    }

    switch (c){
        case 1 :    printf ("case 1");
                    break;
        case 2 :    printf ("case 2");
                    break;
        default :   printf ("default case");
                    break;
    }

}