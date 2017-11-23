/**
 * DES-Encryption C++ (ECB)
 * Copyright (c) 2017 Amin Faiz Khademi
 * 
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
#include <iostream>
#include <stdio.h>
#include <string>
#include <math.h>
using namespace std;

void setB(int &i, int in, int loc)
{
    int hl = 0;
    hl = 1 << 31 - (loc - 1);
    if (in)
        i = i | hl;
    else
        i = i & ~hl;
}

int getB(int i, int loc)
{
    i = i >> 31 - (loc - 1);
    return i & 1;
}

int getV(int in, int b, int e)
{
    int sum = 0;
    int t = 0;
    for (int i = e; i >= b; i--)
    {
        sum += getB(in, i) << t;
        t += 1;
    }
    return sum;
}

void pKEY(int &l, int &r)
{
    int map[56] = {57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36, 63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4};
    int hl = l;
    int hr = r;
    for (int t = 0; t < 56; t++)
    {
        if (map[t] > 32)
        {
            if (t > 27)
            {
                setB(hr, getB(r, map[t] - 32), t - 27);
            }
            else
            {
                setB(hl, getB(r, map[t] - 32), t + 1);
            }
        }
        else
        {
            if (t > 27)
            {
                setB(hr, getB(l, map[t]), t - 27);
            }
            else
            {
                setB(hl, getB(l, map[t]), t + 1);
            }
        }
    }
    r = hr;
    l = hl;

    r = r >> 4;
    r = r << 4;
    l = l >> 4;
    l = l << 4;
}

void pSUBKEY(int &l, int &r)
{
    int map[48] = {14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10, 23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32};
    int hl = l;
    int hr = r;
    for (int t = 0; t < 48; t++)
    {
        if (map[t] > 28)
        {
            if (t > 23)
            {
                setB(hr, getB(r, map[t] - 28), t - 23);
            }
            else
            {
                setB(hl, getB(r, map[t] - 28), t + 1);
            }
        }
        else
        {
            if (t > 23)
            {
                setB(hr, getB(l, map[t]), t - 23);
            }
            else
            {
                setB(hl, getB(l, map[t]), t + 1);
            }
        }
    }
    r = hr;
    l = hl;

    r = r >> 8;
    r = r << 8;
    l = l >> 8;
    l = l << 8;
}

void pIP(int &l, int &r)
{
    int map[64] = {58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4, 62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8, 57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7};
    int hl = l;
    int hr = r;
    for (int t = 0; t < 64; t++)
    {
        if (map[t] > 32)
        {
            if (t > 31)
            {
                setB(hr, getB(r, map[t] - 32), t - 31);
            }
            else
            {
                setB(hl, getB(r, map[t] - 32), t + 1);
            }
        }
        else
        {
            if (t > 31)
            {
                setB(hr, getB(l, map[t]), t - 31);
            }
            else
            {
                setB(hl, getB(l, map[t]), t + 1);
            }
        }
    }
    r = hr;
    l = hl;
}
void funcE(int &l, int &r)
{
    int map[48] = {32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9, 8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17, 16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25, 24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1};
    int hl = l;
    int hr = r;
    for (int t = 0; t < 48; t++)
    {
        if (t > 23)
        {
            setB(hr, getB(r, map[t]), t - 23);
        }
        else
        {
            setB(hl, getB(r, map[t]), t + 1);
        }
    }
    r = hr;
    l = hl;

    r = r >> 8;
    r = r << 8;
    l = l >> 8;
    l = l << 8;
}
int funcS(int num, int row, int column)
{
    int S[512] = {14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7,
                  0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8,
                  4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0,
                  15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13,
                  15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10,
                  3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5,
                  0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15,
                  13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9,
                  10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8,
                  13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1,
                  13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7,
                  1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12,
                  7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15,
                  13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9,
                  10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4,
                  3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14,
                  2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9,
                  14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6,
                  4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14,
                  11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3,
                  12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11,
                  10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8,
                  9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6,
                  4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13,
                  4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1,
                  13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6,
                  1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2,
                  6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12,
                  13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7,
                  1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2,
                  7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8,
                  2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11};
    return (S[(num - 1) * 64 + row * 16 + column]);
    return 0;
}

void finalP(int &l, int &r)
{
    int map[64] = {40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31, 38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29, 36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27, 34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25};
    int hl = l;
    int hr = r;
    for (int t = 0; t < 64; t++)
    {
        if (map[t] > 32)
        {
            if (t > 31)
            {
                setB(hr, getB(r, map[t] - 32), t - 31);
            }
            else
            {
                setB(hl, getB(r, map[t] - 32), t + 1);
            }
        }
        else
        {
            if (t > 31)
            {
                setB(hr, getB(l, map[t]), t - 31);
            }
            else
            {
                setB(hl, getB(l, map[t]), t + 1);
            }
        }
    }
    r = hr;
    l = hl;
}

int lastP(int s)
{
    int map[32] = {16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10, 2, 8, 24, 14, 32, 27, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25};
    int ss = 0;
    for (int t = 0; t < 32; t++)
    {
        setB(ss, getB(s, map[t]), t + 1);
    }
    return ss;
}

int funcF(int r, int kl, int kr)
{
    int er = r, el = 0;
    funcE(el, er);
    kl = kl ^ el;
    kr = kr ^ er;
    int b = 0;
    int s = 0;
    for (int i = 8; i > 0; i--)
    {
        if (i > 4)
        {
            b = getV(kr, i * 6 - 24 - 5, i * 6 - 24);
        }
        else
        {
            b = getV(kl, i * 6 - 5, i * 6);
        }

        int column = getV(b, 28, 31);
        int row = getV(getV(b, 32, 32) | (getV(b, 27, 27) << 1), 30, 32);
        //cout<<row<<"||"<<column<<endl;
        s += funcS(i, row, column) << (8 - i) * 4;
        //cout<<s<<endl;
    }
    return lastP(s);
}

int shiftL(int inp, int size, int rep)
{
    for (int i = 0; i < rep; i++)
    {
        int bit = 0;
        bit = getB(inp, 1);
        bit = bit << 32 - size;
        inp = inp << 1;
        inp = inp | bit;
    }
    return inp;
}
string cInt(long long int number)
{

    char t[8];
    for (int i = 0; i < 8; i++)
    {
        t[i] = ((char)(number >> i * 8));
    }
    string s(t);
    return s;
}

void Cipher(long long int msg, long long int key)
{
    int f = 0;
    int keyr = (int)(key);
    int keyl = (int)(key >> 32);
    cout << "Key Left int: " << keyl << "  Key Right int: " << keyr << endl;
    int c0 = 0, d0 = 0;
    pKEY(keyl, keyr);
    c0 = keyl;
    d0 = keyr;
    int kl = 0, kr = 0;
    int r0 = (int)(msg);
    int l0 = (int)(msg >> 32);
    cout << "Msg Left int: " << l0 << "  Msg Right int: " << r0 << endl;
    pIP(l0, r0);
    for (int i = 1; i < 17; i++)
    {
        int t = 2;
        if (i == 1 || i == 2 || i == 9 || i == 16)
        {
            t = 1;
        }
        c0 = shiftL(c0, 28, t);
        d0 = shiftL(d0, 28, t);
        kl = c0;
        kr = d0;
        pSUBKEY(kl, kr);
        int pl0 = l0;
        l0 = r0;
        r0 = pl0 ^ funcF(r0, kl, kr);
    }
    int rt = 0;
    rt = r0;
    r0 = l0;
    l0 = rt;
    finalP(l0, r0);
    long long int final = l0 + 1;
    final = final << 32;
    final += r0;
    cout << "Cipher (hex): " << hex << final << "\nChipher Left (hex): " << l0 << "  Chipher Right (hex): " << r0 << endl;
}

int main()
{
    string msg; //=7882833662174520622;
    string key; //=4062943354666313081;
    long long int keya[8];
    long long int msga[8];
    long long int msgd;
    long long int keyd;
    cout << "DES-Encryption C++ (ECB)" << endl;
    cout << "Copyright (c) 2017 Amin Faiz Khademi. All rights reserved." << endl;
    cout << "MIT license" << endl
         << endl;
    cout << "Enter message (8 byte plaint text):";
    cin >> msg;
    cout << "Enter key (8 byte plaint text):";
    cin >> key;
    for (size_t i = 0; i < msg.size(); ++i)
    {
        msga[i] = static_cast<int>(static_cast<unsigned char>(msg[i]));
    }
    for (size_t i = 0; i < key.size(); ++i)
    {
        keya[i] = static_cast<int>(static_cast<unsigned char>(key[i]));
    }
    for (int i = 0; i < 8; i++)
    {
        msgd += (msga[i] << ((7 - i) * 8));
    }
    for (int i = 0; i < 8; i++)
    {
        keyd += (keya[i] << ((7 - i) * 8));
    }
    cout << "Your Msg (decimal): " << msgd << endl;
    cout << "Your Key (decimal): " << keyd << endl;
    // Msg      6D6573736167652E    //
    // Key      38627974656B6579    //
    //Cipher hex  7CF45E129445D451    //
    //cipher int 9003924984615523409 //
    Cipher(msgd, keyd);
    return 0;
}
