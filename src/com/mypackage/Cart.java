package com.mypackage;

/**
 * Created by 13590_000 on 5/26/2015.
 */


public class Cart {

    private Clothes p;
    private int quantity;

    public Cart() {
    }

    public Cart(Clothes p, int quantity) {
        this.p = p;
        this.quantity = quantity;
    }

    public Clothes getP() {
        return p;
    }

    public void setP(Clothes p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
