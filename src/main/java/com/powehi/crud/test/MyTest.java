package com.powehi.crud.test;

import java.util.Arrays;

public class MyTest {
    public static void main(String[] args) {
        int[] a1 = {2,4};
        int[] s2 = {1,2,3,4};
        int[] ints = nextGreaterElement(a1, s2);
        System.out.println(Arrays.toString(ints));
    }
    public static int[] nextGreaterElement(int[] nums1, int[] nums2) {
        boolean flag; 
        int[] res = new int[nums1.length];
        for(int i=0;i<nums1.length;i++){
            flag = false;
            for(int j=i;j<nums2.length-1;j++){
                if(nums2[j+1]>nums1[i]){
                    res[i] = nums2[j];
                    flag = true;
                    break;
                }
            }
            if(!flag){
                res[i]=-1;
            }
        }
        return res;
    }
}
