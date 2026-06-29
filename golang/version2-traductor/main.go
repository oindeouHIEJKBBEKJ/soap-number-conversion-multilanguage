package main

import (
	"fmt"
	"net/http"

	gt "github.com/bas24/googletranslatefree"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		numero := r.URL.Query().Get("n")

		english := map[string]string{
			"10": "ten",
			"20": "twenty",
			"30": "thirty",
		}

		texto := english[numero]

		traducido, _ :=
			gt.Translate(texto, "en", "es")

		fmt.Fprint(w, traducido)

	})

	fmt.Println("Servidor en puerto 8000")

	http.ListenAndServe(":8000", nil)
}