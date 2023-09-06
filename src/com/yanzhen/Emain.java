package com.yanzhen;

import java.util.Scanner;

public class Emain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();
        String S = sc.next();
        sc.close();
        System.out.println(solve(S, k));
    }


    public static String solve(String S, int k) {
        for (int i = 0; i < k; i++) {
            S = F(S);
        }
        return S;
    }

    public static String F(String s) {
        return trim(flip(s));
    }

    public static String trim(String s) {
        int i = 0;
        while (i < s.length() && s.charAt(i) == '0') {
            i++;
        }
        if (i == s.length()) {
            return "0";
        } else {
            return s.substring(i);
        }
    }

    public static String flip(String s) {
        StringBuilder sb = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (c == '0') {
                sb.append('1');
            } else {
                sb.append('0');
            }
        }
        return sb.toString();
    }
}
