package com.portal.schemes.exception;

public class TokenExpiredException extends RuntimeException {

    public TokenExpiredException() {
        super("Authentication token has expired");
    }

    public TokenExpiredException(String message) {
        super(message);
    }
}