package main

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"

	"github.com/ignratnan/ics-notes.com/backend/packages/database"
)

func main() {
	database.ConnectDB()

	r := gin.Default()

	// Enable CORS so Vue can access
	r.Use(cors.Default())

	check := database.CheckAdmin()
	database.CreateAdmin(check)

	r.GET("/events", database.GetEvents)
	r.GET("/contacts", database.GetContacts)
	r.GET("/companies", database.GetCompanies)
	r.GET("/events/create-event", database.GetCreateEvent)
	r.POST("/events/create-event", database.PostCreateEvent)
	r.POST("/login", database.PostLogin)

	r.Run(":8080") // Run on http://localhost:8080

}
