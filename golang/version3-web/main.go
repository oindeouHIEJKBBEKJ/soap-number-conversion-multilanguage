package main

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/divan/num2words"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		numero :=
			r.URL.Query().Get("n")

		n, _ :=
			strconv.Atoi(numero)

		texto :=
			num2words.Convert(n, "es")

		fmt.Fprint(w, texto)

	})

	fmt.Println("Servidor en puerto 8000")

	http.ListenAndServe(":8000", nil)
}