package com.portal.schemes.exception;

public class ProfileIncompleteException extends RuntimeException {

    public ProfileIncompleteException() {
        super("Please complete your profile before accessing this feature");
    }

    public ProfileIncompleteException(String message) {
        super(message);
    }
}