#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* maps successively from 'a' to 'z' plus ' ' to denote any non-letter */
char *codes[] = {
    "AAAAA", "AAAAB", "AAABA", "AAABB", "AABAA",
    "AABAB", "AABBA", "AABBB", "ABAAA", "ABAAB",
    "ABABA", "ABABB", "ABBAA", "ABBAB", "ABBBA",
    "ABBBB", "BAAAA", "BAAAB", "BAABA", "BAABB",
    "BABAA", "BABAB", "BABBA", "BABBB", "BBAAA",
    "BBAAB", "BBBAA"
};

char *get_code(const char c) {
    if (c >= 97 && c <= 122) return codes[c - 97];
    return codes[26];
}

char get_char(const char *code) {
    int i;
    if (!strcmp(codes[26], code)) return ' ';
    for (i = 0; i < 26; ++i) {
        if (strcmp(codes[i], code) == 0) return 97 + i;
    }
    printf("\nCode \"%s\" is invalid\n", code);
    exit(1);
}

void str_tolower(char s[]) {
    int i;
    for (i = 0; i < strlen(s); ++i) s[i] = tolower(s[i]);
}

char *bacon_encode(char plain_text[], char message[]) {
    int i, count;
    int plen = strlen(plain_text), mlen = strlen(message);
    int elen = 5 * plen;
    char c;
    char *p, *et, *mt;
    et = malloc(elen + 1);  
    str_tolower(plain_text);
    for (i = 0, p = et; i < plen; ++i, p += 5) {
        c = plain_text[i];
        strncpy(p, get_code(c), 5);
    }
    *++p = '\0';

    /* 'A's to be in lower case, 'B's in upper case */
    str_tolower(message);
    mt = calloc(mlen + 1, 1);
    for (i = 0, count = 0; i < mlen; ++i) {
        c = message[i];
        if (c >= 'a' && c <= 'z') {
            if (et[count] == 'A')
                mt[i] = c;
            else
                mt[i] = c - 32;  /* upper case equivalent */
            if (++count == elen) break;
        }
        else mt[i] = c;
    }
    free(et);     
    return mt;
}

char *bacon_decode(char cipher_text[]) {
    int i, count, clen = strlen(cipher_text);
    int plen;
    char *p, *ct, *pt;
    char c, quintet[6];
    ct = calloc(clen + 1, 1);
    for (i = 0, count = 0; i < clen; ++i) {
        c = cipher_text[i];
        if (c >= 'a' && c <= 'z')
            ct[count++] = 'A';
        else if (c >= 'A' && c <= 'Z')
            ct[count++] = 'B';
    }

    plen = strlen(ct) / 5; 
    pt = malloc(plen + 1);
    for (i = 0, p = ct; i < plen; ++i, p += 5) {
        strncpy(quintet, p, 5);
        quintet[5] = '\0';
        pt[i] = get_char(quintet);
    }
    pt[plen] = '\0';
    free(ct);
    return pt;
} 

int main() {
    char plain_text[] = "the quick brown fox jumps over the lazy dog";
    char message[] = "bacon's cipher is a method of steganography created by francis bacon."
        "this task is to implement a program for encryption and decryption of "
        "plaintext using the simple alphabet of the baconian cipher or some "
        "other kind of representation of this alphabet (make anything signify anything). "
        "the baconian alphabet may optionally be extended to encode all lower "
        "case characters individually and/or adding a few punctuation characters "
        "such as the space.";
    char *cipher_text, *hidden_text;
    cipher_text = bacon_encode(plain_text, message);
    printf("Cipher text ->\n\n%s\n", cipher_text);
    hidden_text = bacon_decode(cipher_text);
    printf("\nHidden text ->\n\n%s\n", hidden_text);
    free(cipher_text);
    free(hidden_text);
    return 0;
}