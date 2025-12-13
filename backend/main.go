package main

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"

	"github.com/ignratnan/ics-notes.com/backend/packages/database"
)

func main() {
	database.ConnectDB()

	r := gin.Default()

	r.Use(cors.Default())

	check := database.CheckAdmin()
	database.CreateAdmin(check)

	r.POST("/login", database.PostLogin)

	r.GET("/notes", database.GetNotes)
	r.GET("/events", database.GetEvents)
	r.GET("/events/:id", database.GetEventByID)
	r.GET("/contacts", database.GetContacts)
	r.GET("contacts/:id", database.GetContactById)
	r.POST("/contacts", database.PostContact)
	r.PUT("/contacts/:id", database.EditContact)
	r.DELETE("/contacts/:id", database.DeleteContact)
	r.GET("/companies", database.GetCompanies)
	r.GET("/events/create-event", database.GetCreateEvent)
	r.POST("/events", database.PostCreateEvent)
	r.PUT("/events/:id", database.EditEvent)
	r.DELETE("/events/:id", database.DeleteEvent)
	r.POST("/logout", database.LogoutHandler)

	/*
		private := r.Group("/")

		private.Use(middleware.AuthRequired())
		{
			private.GET("/events", database.GetEvents)
			private.GET("/events/:id", database.GetEventByID)
			private.GET("/contacts", database.GetContacts)
			private.GET("contacts/:id", database.GetContactById)
			private.POST("/contacts", database.PostContact)
			private.PUT("/contacts/:id", database.EditContact)
			private.DELETE("/contacts/:id", database.DeleteContact)
			private.GET("/companies", database.GetCompanies)
			private.GET("/events/create-event", database.GetCreateEvent)
			private.POST("/events", database.PostCreateEvent)
			private.PUT("/events/:id", database.EditEvent)
			private.DELETE("/events/:id", database.DeleteEvent)
			private.POST("/logout", database.LogoutHandler)
		}
	*/

	r.Run(":8080") // Run on http://localhost:8080

}
