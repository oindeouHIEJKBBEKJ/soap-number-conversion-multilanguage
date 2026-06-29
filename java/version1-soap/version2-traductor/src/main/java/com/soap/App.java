package com.soap;

import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

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

            String numero =
                    query.split("=")[1];

            String resultado = "";

            switch (numero) {

                case "10":
                    resultado = "diez";
                    break;

                case "20":
                    resultado = "veinte";
                    break;

                case "30":
                    resultado = "treinta";
                    break;

                default:
                    resultado = "sin traducción";
            }

            exchange.sendResponseHeaders(
                    200,
                    resultado.length());

            exchange.getResponseBody()
                    .write(resultado.getBytes());

            exchange.close();

        });

        server.start();

        System.out.println(
                "Servidor iniciado");
    }
}