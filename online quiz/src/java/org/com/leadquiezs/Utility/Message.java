/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Utility;

import java.io.Serializable;

/**
 *
 * @author MohamedSayed
 * @param <T>
 */

public class Message<T> implements Serializable {
    public static final String Role="Role";
    public static final String Access="Access";
    public static final String Error="ErrorRegister";
    private String title;
    private T message;
    public Message() {
      
        this("", null);
    }
    public Message(String title,T message) {
        setMessage(message);
        setTitle(title);
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setMessage(T message) {
        this.message = message;
    }

    public T getMessage() {
        return message;
    }
}
