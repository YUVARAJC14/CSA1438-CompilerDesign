%{
%}

%%
^[aeiouAEIOU][a-zA-Z]*$ {
    printf("Accepted: %s\n", yytext);
}
.|\n { }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string starting with a vowel: \n");
    yylex();
    return 0;
}
