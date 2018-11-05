package com.iyeeku.watch.utils;

import java.net.InetAddress;
import java.security.SecureRandom;

public class UUIDGenerator {

    private static SecureRandom SEEDER_STATIC = null;
    private static byte[] ADDRESS = null;
    private static String MID_VALUE_STATIC = null;
    private String midValue = null;
    private SecureRandom seeder = null;

    public UUIDGenerator(){
        StringBuilder buffer = new StringBuilder(16);
        buffer.append(MID_VALUE_STATIC);
        buffer.append(toHex(System.identityHashCode(this), 8));
        this.midValue = buffer.toString();
        this.seeder = new SecureRandom();
        this.seeder.nextInt();
    }

    public static String generate(Object obj){
        StringBuilder uid = new StringBuilder(32);

        long currentTimeMillis = System.currentTimeMillis();
        uid.append(toHex((int)(currentTimeMillis & 0xFFFFFFFF), 8));

        uid.append(MID_VALUE_STATIC);

        uid.append(toHex(System.identityHashCode(obj), 8));

        uid.append(toHex(getRandom(), 8));

        return uid.toString();
    }

    public String generate(){
        StringBuilder uid = new StringBuilder(32);

        long currentTimeMillis = System.currentTimeMillis();
        uid.append(toHex((int)(currentTimeMillis & 0xFFFFFFFF), 8));

        uid.append(this.midValue);

        uid.append(toHex(this.seeder.nextInt(), 8));

        return uid.toString();
    }

    private static String toHex(int value,int length){
        char[] hexDigits = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
        StringBuilder buffer = new StringBuilder(length);
        int shift = length - 1 << 2;
        int i = -1;
        while(true){
            i++;
            if(i>=length)
                break;
            buffer.append(hexDigits[(value >> shift & 0xF)]);
            value <<= 4;
        }
        return buffer.toString();
    }

    private static int toInt(byte[] bytes){
        int value = 0;
        int i = -1;
        while(true){
            i++;
            if(i>=bytes.length)
                break;
            value <<= 8;
            value |= bytes[i] & 0xFF;
        }
        return value;
    }

    private static synchronized int getRandom(){
        return SEEDER_STATIC.nextInt();
    }

    static
    {
        try{
            ADDRESS = InetAddress.getLocalHost().getAddress();
            StringBuilder buffer = new StringBuilder(8);
            buffer.append(toHex(toInt(ADDRESS), 8));
            MID_VALUE_STATIC = buffer.toString();
            SEEDER_STATIC = new SecureRandom();
            SEEDER_STATIC.nextInt();
        }catch(Exception ex){
           ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(UUIDGenerator.generate("IYEEKU"));
        //System.out.println(UUIDGenerator.generate(""));
    }

}
