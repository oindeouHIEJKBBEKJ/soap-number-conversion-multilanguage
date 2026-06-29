package main

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/hooklift/gowsdl/soap"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		numero := r.URL.Query().Get("n")

		client := soap.NewClient(
			"https://www.dataaccess.com/webservicesserver/NumberConversion.wso"
		)

		req := fmt.Sprintf(`
		<NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
			<ubiNum>%s</ubiNum>
		</NumberToWords>`, numero)

		var resp interface{}

		client.Call(
			"http://www.dataaccess.com/webservicesserver/NumberToWords",
			req,
			&resp,
		)

		fmt.Fprintf(w, "%v", resp)

	})

	fmt.Println("Servidor en puerto 8000")
	http.ListenAndServe(":8000", nil)
}