%{
 #include <bits/stdc++.h>
 #include <cstring>
 #include <map>
 #include <set>
 #include <iterator>
 using namespace std;
 map <string,int> keyword;
 set<string> ic;
 set<string> fc;
 set<string> id;
 set<string> op;
 set<string> punc;
 set<string> str;
 set<string> shop;
 int line = 0;
%}

digit [0-9]
alpha [_a-zA-Z]
var [_0-9a-zA-Z]
dot [.]
keywords    int|float|char|if|else|do|break|continue|for|extern|while|goto|long|return|void|switch|auto|case|default|enum|register|sizeof|static|struct|typedef|union|unsigned|double|const|short|signed|volatile
operators   [-=+*/%><|?~!,^]
ES  (\\(['"\?\\abfnrtv]|[0-7]{1,3}|x[a-fA-F0-9]+))
WS  [ \t\v\f]

%%

"\n"             {line++;}
"//".*              ;
[+-]?{digit}+               {ic.insert(yytext);}
[+-]?{digit}+{dot}{digit}+      {fc.insert(yytext);}
{keywords}                      {keyword[yytext]++;}
(\"([^"\\\n]|{ES})*\"{WS}*)+	{ str.insert(yytext); }
{alpha}{var}*              	{id.insert(yytext);}
{digit}+{var}+               { cout<<"Unrecognised token "<<yytext <<" at line number "<<line+1<<'\n'; }
{operators}                 	{op.insert(yytext);}
";"				{punc.insert(yytext);}
":"				{punc.insert(yytext);}
"++"				{op.insert(yytext);}
"--"				{op.insert(yytext);}
">="				{op.insert(yytext);}
"<="				{op.insert(yytext);}
"||"				{op.insert(yytext);}
"!="				{op.insert(yytext);}
"=="				{op.insert(yytext);}
"("				{punc.insert(yytext);}
"{"				{punc.insert(yytext);}
"["				{punc.insert(yytext);}
"]"				{punc.insert(yytext);}
"}"				{punc.insert(yytext);}
")"				{punc.insert(yytext);}
">>"				{op.insert(yytext);}
"<<"				{op.insert(yytext);}
"&&"				{op.insert(yytext);}
"&"				{op.insert(yytext);}
"->"				{op.insert(yytext);}
"."				{op.insert(yytext);}
">>="					{ shop.insert(yytext); }
"<<="					{ shop.insert(yytext); }
"+="					{ shop.insert(yytext); }
"-="						{ shop.insert(yytext); }
"*="					{ shop.insert(yytext); }
"/="					{ shop.insert(yytext); }
"%="					{ shop.insert(yytext); }
"&="						{ shop.insert(yytext); }
"^="					{ shop.insert(yytext); }
"|="					{ shop.insert(yytext); }
{WS}+                    	;
.                   {cout<<"Unrecognised token "<<yytext <<" at line number "<<line+1<<'\n';}

%%

int main(int argc,char * argv[])
{
    int i;
    yyin=fopen(argv[1],"r");
    yylex();
    cout<<"\n\n";
    cout<<"The number of lines in the code are "<<line+1<<endl;
    cout<<"\n\n";
    for( set<string>::iterator it=ic.begin();it!=ic.end();it++){
        cout<< *it << " -> INTEGER CONSTANT"<< endl;
    }
    cout<<"\n\n";
    for(set<string>::iterator it=fc.begin();it!=fc.end();it++){
        cout<< *it << " -> FLOAT CONSTANT"<<endl;
    }
    cout<<"\n\n";
    for( set<string>::const_iterator it=str.begin();it!=str.end();it++){
        cout<< *it << " -> STRING CONSTANT"<< endl;
    }
    cout<<"\n\n";
    for(set<string>::iterator it=id.begin();it!=id.end();it++){
        cout<< *it << " -> IDENTIFIER"<<endl;
    }
    cout<<"\n\n";
    for(set<string>::iterator it=punc.begin();it!=punc.end();it++){
        cout<< *it << " -> PUNCTUATOR" << endl;
    }
    cout<<"\n\n";
    for(set<string>::iterator it=op.begin();it!=op.end();it++){
        cout<< *it <<" -> OPERATOR" <<endl;
    }
    cout<<"\n\n";
    for(set<string>::iterator it=shop.begin();it!=shop.end();it++){
        cout<< *it <<" -> SHORT HAND OPERATOR" <<endl;
    }
    cout<<"\n\n";
    for(map<string,int>::iterator it = keyword.begin();it!=keyword.end();it++){
        cout<< it->first << " -> KEYWORD -> " << it->second << " TIMES"<<endl;
    }
    cout<<"\n\n";

    fclose(yyin);
}