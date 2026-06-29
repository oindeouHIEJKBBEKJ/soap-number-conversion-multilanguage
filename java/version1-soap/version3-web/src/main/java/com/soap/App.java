package com.soap;

import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;
import java.util.Locale;

import com.github.gcardone.junidecode.*;
import java.text.*;

public class App {

    public static void main(String[] args)
            throws Exception {

        HttpServer server =
                HttpServer.create(
                        new InetSocketAddress(8000),
                        0);

        server.createContext("/", exchange -> {

            String query =
                    exchange.getRequestURI()
                            .getQuery();

            int numero =
                    Integer.parseInt(
                            query.split("=")[1]);

            String texto;

            switch (numero) {

                case 10:
                    texto = "diez";
                    break;

                case 100:
                    texto = "cien";
                    break;

                case 1000:
                    texto = "mil";
                    break;

                default:
                    texto = String.valueOf(numero);
            }

            exchange.sendResponseHeaders(
                    200,
                    texto.length());

            exchange.getResponseBody()
                    .write(texto.getBytes());

            exchange.close();

        });

        server.start();

        System.out.println(
                "Servidor iniciado");
    }
}