package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	GCPProjectID := os.Getenv("GCP_PROJECT_ID")
	url := fmt.Sprintf("https://backend-dot-%s.uc.r.appspot.com", GCPProjectID)
	res, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}

	responseData, err := io.ReadAll(res.Body)

	fmt.Fprintf(w, "Backend said: %s", responseData)
}
